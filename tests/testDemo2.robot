*** Settings ***
Documentation  To validate the Login Form
Library        SeleniumLibrary
Library        Collections
Test Setup     open the browser with login url
Test Teardown  Close Browser Session
Resource       ../pageObject/Generic.robot


*** Test Cases ***
#Validate UnSuccessful Login
#   Fill the Login Form      ${username}    ${invalidPwd}
#   wait until element is located in the Page      ${Login_Error_Message}
#   verify error message is correct

Validate card display in the Shopping Cart
   Fill the Login Form  ${username}    ${validPwd}
   wait until element is located in the Page        ${checkout_button}
   Verify Card Titles in the Shop Page
   Select the card      Nokia Edge


*** Keywords ***


Fill the Login Form
   [arguments]     ${username}  ${password}
   input text      id:username   ${username}
   input password  id:password   ${password}
   click element   css:input[value='user']
   wait until element is visible  css:.modal-body
   click button   id:okayBtn
   click button   id:okayBtn
   wait until element is not visible    css:.modal-body
   sleep    5
   Select From List By Value      css:select.form-control   teach
   select checkbox   terms
   Checkbox Should Be Selected      terms
   click button    signInBtn


wait until element is located in the Page
   [arguments]      ${element}
   wait until element is visible    ${element}


verify error message is correct
   ${errMsg}=   get text  css:.alert-danger
   should be equal as Strings   ${errMsg}  Incorrect username/password.
   element text should be     ${Login_Error_Message}  Incorrect username/password.

Verify Card Titles in the Shop Page
   @{titles}=   Create list     iphone X     Samsung Note 8     Nokia Edge      Blackberry
   ${expectedList}=     get webelements     css:.card-title
   @{actualList}=       Create list
   FOR  ${element}  IN      @{expectedList}
       LOG  ${element.text}
       append to list    ${actualList}     ${element.text}
   END
   lists should be equal    ${titles}       ${actualList}

Select the card
   [arguments]      ${cardName}
   ${expectedList}=     get webelements     css:.card-title
   ${index}=    Set variable    1
   FOR  ${element}  IN      @{expectedList}
       Exit For Loop If     '${cardName}' == '${element.text}'
       ${index}=    Evaluate    ${index} + 1
   END
   click button     xpath:(//*[@class='card-footer'])[${index}]/button
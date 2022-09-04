*** Settings ***
Documentation  Login Form
Library        SeleniumLibrary
Library        Collections
Resource       Generic.robot

*** Variables ***
${checkout_button}=     css:.nav-link
${Login_Error_Message}=     css:.alert-danger

*** Keywords ***
wait until element is located in the Page
   wait until element Passed is located in the Page    ${checkout_button}

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

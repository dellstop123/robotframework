*** Settings ***
Documentation  Login Form
Library        SeleniumLibrary
Resource       Generic.robot


*** Variables ***
${username}=    rahulshettyacademy
${invalidPwd}=  12345678
${validPwd}=    learning
${url}=     https://rahulshettyacademy.com/loginpagePractise/
${Login_Error_Message}=     css:.alert-danger

*** Keywords ***
Fill the Login Form
   [arguments]     ${username}  ${password}
   input text      id:username   ${username}
   input password  id:password   ${password}
   click element   css:input[value='user']
   wait until element is visible  css:.modal-body
   sleep    5
   click button   id:okayBtn
#   click button   id:okayBtn
   wait until element is not visible    css:.modal-body
   sleep    5
   Select From List By Value      css:select.form-control   teach
   select checkbox   terms
   Checkbox Should Be Selected      terms
   click button    signInBtn

wait until element is located in the Page
   wait until element Passed is located in the Page    ${Login_Error_Message}

verify error message is correct
   ${errMsg}=   get text  css:.alert-danger
   should be equal as Strings   ${errMsg}  Incorrect username/password.
   element text should be     ${Login_Error_Message}  Incorrect username/password.
*** Settings ***
Documentation  To validate the Login Form
Library        SeleniumLibrary
Test Setup     open the browser with login url
Test Teardown  Close Browser Session
Test Template  Validate UnSuccessful Login
Resource       ../pageObject/Generic.robot

*** Variables ***
${Login_Error_Message}  css:.alert-danger

*** Test Cases ***      username        password
Invalid Username        abcdef          learning
INvalid Password        rahulshetty     abcdef
Special Characters      @##%^           learning

*** Keywords ***
Validate UnSuccessful Login
   [Arguments]         ${username}         ${password}
   open the browser with login url
   Fill the Login Form      ${username}         ${password}
   wait until it checks and display error messages
   verify error message is correct


Fill the Login Form
   [arguments]     ${username}         ${password}
   input text      id:username   ${username}
   input password  id:password   ${password}
   click button    signInBtn

wait until it checks and display error messages
   wait until element is visible   ${Login_Error_Message}

verify error message is correct
   ${errMsg}=   get text  css:.alert-danger
   should be equal as Strings   ${errMsg}  Incorrect username/password.
   element text should be     ${Login_Error_Message}  Incorrect username/password.

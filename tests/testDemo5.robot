*** Settings ***
Documentation  To validate the Login Form
Library        SeleniumLibrary
Library        ../customLibraries/Shop.py
Library        DataDriver       file=resources/data.csv     encoding=utf_8      dialect=unix
Test Setup     open the browser with login url
Test Teardown  Close Browser Session
Resource       ../pageObject/Generic.robot
Test Template  Validate UnSuccessful Login

*** Variables ***
${Login_Error_Message}  css:.alert-danger

*** Test Cases ***
Login with user ${username} and password ${password}        xyz     123456


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

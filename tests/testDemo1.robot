*** Settings ***
Documentation  To validate the Login Form
Library        SeleniumLibrary
Test Teardown  Close Browser
Resource       ../pageObject/Generic.robot


*** Variables ***
${Login_Error_Message}  css:.alert-danger


*** Test Cases ***
Validate UnSuccessful Login
   open the browser with login url
   Fill the Login Form
   wait until it checks and display error messages
   verify error message is correct


*** Keywords ***


Fill the Login Form
   input text      id:username   GuneetSingh
   input password  id:password   12345678
   click button    signInBtn

wait until it checks and display error messages
   wait until element is visible   ${Login_Error_Message}

verify error message is correct
   ${errMsg}=   get text  css:.alert-danger
   should be equal as Strings   ${errMsg}  Incorrect username/password.
   element text should be     ${Login_Error_Message}  Incorrect username/password.

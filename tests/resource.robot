*** Settings ***
Documentation  To validate the Login Form
Library        SeleniumLibrary



*** Variables ***
${username}=    rahulshettyacademy
${invalidPwd}=  12345678
${validPwd}=    learning
${url}=     https://rahulshettyacademy.com/loginpagePractise/
${Login_Error_Message}=     css:.alert-danger
${Login_Error_Message}=     css:.alert-danger
${listofProducts}=      Nokia Edge      Blackberry

*** Keywords ***
open the browser with login url
   open browser  ${url}  Firefox

Close Browser Session
   close browser
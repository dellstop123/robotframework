*** Settings ***
Documentation  To validate the Login Form
Library        SeleniumLibrary



*** Variables ***
${username}=    rahulshettyacademy
${invalidPwd}=  12345678
${validPwd}=    learning
${url}=     https://rahulshettyacademy.com/loginpagePractise/
${browser_name}=    Firefox

*** Keywords ***
open the browser with login url
   open browser  ${url}  ${browser_name}

wait until element Passed is located in the Page
   [arguments]      ${pageLocator}
   wait until element is visible    ${pageLocator}

Close Browser Session
   close browser
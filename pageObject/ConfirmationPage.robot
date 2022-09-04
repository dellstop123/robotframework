*** Settings ***
Documentation  Login Form
Library        SeleniumLibrary
Library        Collections
Resource       Generic.robot
Resource       ../tests/testDemo6.robot

*** Variables ***
${checkout_button}=     css:.nav-link
${Login_Error_Message}=     css:.alert-danger

*** Keywords ***
Enter the country and select the Terms
    [arguments]     ${country_name}
    input text      country     ${country_name}
    wait until element Passed is located in the Page        //a[text()='${country_name}']
    click element       //a[text()='${country_name}']
    click element      css:.checkbox label

Purchase the Product and Confirm the Purchase
    click button    css:.btn-success
    page should contain     Success!
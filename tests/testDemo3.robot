*** Settings ***
Documentation  To validate the Login Form
Library        SeleniumLibrary
Library        Collections
Library        String
Test Setup     open the browser with login url
Test Teardown  Close Browser Session
Resource       ../pageObject/Generic.robot


*** Test Cases ***

Validate Child Window Functionality
   Select the link of child window
   Verify the user is switched to child window
   Grab the email id in the child window
   Switched to Parent window and enter the email

*** Keywords ***
Select the link of child window
    click element       css:.blinkingText
    sleep               5

Verify the user is switched to child window
    switch window       NEW
    element text should be      css:h1      DOCUMENTS REQUEST

Grab the email id in the child window
    ${text}=    get text    css:.red
    @{words}=   split string    ${text}     at
    ${text_split}=      get from list       ${words}    1
    @{email}=   split string    ${text_split}
    ${text_split_again}=      get from list       ${email}    0
    Set global variable     ${text_split_again}

Switched to Parent window and enter the email
   switch window    MAIN
   title should be  LoginPage Practise | Rahul Shetty Academy
   input text      id:username   ${text_split_again}
   sleep            5
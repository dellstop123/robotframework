*** Settings ***
Documentation  To validate the Login Form
Library        SeleniumLibrary
Library        Collections
Library        ../customLibraries/Shop.py
Test Setup     open the browser with login url
Test Teardown  Close Browser Session
#Resource       resource.robot
Resource       ../pageObject/LandingPage.robot
Resource       ../pageObject/ShopPage.robot
Resource       ../pageObject/Generic.robot
Resource       ../pageObject/CheckoutPage.robot
Resource       ../pageObject/ConfirmationPage.robot

*** Variables ***
${listofProducts}=      Nokia Edge      Blackberry
${country_name}=        India

*** Test Cases ***
Validate UnSuccessful Login
   [Tags]      SMOKE        REGRESSION
   LandingPage.Fill the Login Form      ${username}    ${invalidPwd}
   LandingPage.wait until element is located in the Page
   LandingPage.verify error message is correct

Validate card display in the Shopping Cart
   [Tags]       NEWFEATURE
   LandingPage.Fill the Login Form      ${username}    ${validPwd}
   ShopPage.wait until element is located in the Page
   ShopPage.Verify Card Titles in the Shop Page
   add items to cart    ${listofProducts}
   CheckoutPage.Verify elements in the Page and Checkout
   ConfirmationPage.Enter the country and select the Terms      ${country_name}
   ConfirmationPage.Purchase the Product and Confirm the Purchase
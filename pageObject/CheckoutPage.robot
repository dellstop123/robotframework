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
Verify elements in the Page and Checkout
#   @{titles}=   Create list     ${listofProducts}
#   ${checkoutTitle}=    get webelements     css:h4.media-heading
#   @{actualList}=       Create list
#   FOR  ${element}  IN      @{checkoutTitle}
#       append to list    ${actualList}     ${element.text}
#   END
#   lists should be equal    ${titles}       ${actualList}

   click button     css:.btn-success

# Robotframework Demo

This is the simple Git Project of Robot Framework in which you can find "How to create Robot Framework and write code in it"

Most importantly, you will learn "How to create our own libraries in Robot Framework"

This Robot Framework is very easy to Learn, Code and Design.


# Robot Framework Commands Used:
> cd tests
>
> robot testDemo1.robot

# Add RunTime Browser in the Commands:

> robot --variable browser_name: Firefox testDemo1.robot

# Run Robot Files through Tag Name:

> robot testDemo1.robot SMOKE

> robot testDemo1.robot REGRESSION

# Run Multiple Tag Names:

> robot testDemo1.robot SMOKEANDREGRESSION

> robot testDemo1.robot SMOKEORREGRESSION


# Run the whole test Suite with one command:

> cd .. ( open the main folder)

> robot tests .

### Note: 
   > If you want to run through tags into whole test Suite then replace file name `testDemo1.robot` with `.` 

# [TestDemo1.robot](https://github.com/dellstop123/robotframework/blob/master/tests/testDemo1.robot)
 
## In this file, you will see only 1 Test Case having Unsuccessful Login.
     
  <details><summary> Settings </summary>
  <section>
     
### In this section, we are importing the external libraries, files and we can also use Test Setup, Test Teardown, Suite Setup and Suite Teardown. We can import resource file in this section from anywhere in the project.
     
     
       
         *** Settings ***
            Documentation  To validate the Login Form
            Library        SeleniumLibrary
            Test Teardown  Close Browser
            Resource       ../pageObject/Generic.robot
    
       
    </section>
     </details>
  
   
   <details><summary> Variables </summary>
   <section>    
      
### Variable section is used to create Global variable and assigned global value to a variable which is used inside the file or you can also used that variable within the project.
      
      
      
      *** Variables ***
         ${Login_Error_Message}  css:.alert-danger
      
      
   </section>  
    </details> 
   
   <details><summary> Test Cases </summary>
   <section>    
      
### In this section, You can only write Test Cases and passes arguements in it.
      
      
      *** Test Cases ***
### Validate UnSuccessful Login
   - open the browser with login url
   - Fill the Login Form
   - wait until it checks and display error messages
   - verify error message is correct
      
      
   </section>  
    </details> 
   
   
   <details><summary> Keywords </summary>
   <section>    
      
### In this section, You can only write Keywords that are used in the Test Cases. In the coding perpective, it is the method declaration/definition.
      
      
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

      
   </section>  
   </details>

# Test Case Run and Result File

![Test Run File](https://github.com/dellstop123/robotframework/blob/master/7.PNG)

# Log File Snapshot

![Log File](https://github.com/dellstop123/robotframework/blob/master/8.PNG)

# Test Report File

![Test Report](https://github.com/dellstop123/robotframework/blob/master/9.PNG)
![Test Report 2](https://github.com/dellstop123/robotframework/blob/master/10.PNG)



For any clarification, please contact or DM me at ,<i class="bi bi-linkedin">https://www.linkedin.com/in/guneet-singh-709703182/</i>

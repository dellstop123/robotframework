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

<details><summary> Details </summary>
  
  <p>
      In this file, you will see only 1 Test Case having Unsuccessful Login
    
      This is the Libraries or any external file we are import are defined in this section
       ```
         *** Settings ***
            Documentation  To validate the Login Form
            Library        SeleniumLibrary
            Test Teardown  Close Browser
            Resource       ../pageObject/Generic.robot
    
       ```
  </p>
  
<details>  


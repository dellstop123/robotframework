*** Settings ***
Library     Collections


*** Test Case ***
Play with dictionary
    &{data}=    Create dictionary       name=Guneet     place=Jammu     college=University of Jammu
    log     ${data}
    dictionary should contain key       ${data}     name
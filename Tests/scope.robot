*** Settings ***
Resource    ../Resources/PO/scope.robot


*** Variables ***
# you can override this file
#${my_variable}    comes from script file
*** Test Cases ***
Create and Log a variable

    log to console    ${my_variable}
Access a variable
    log to console    ${my_variable}
*** Keywords ***


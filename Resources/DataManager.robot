*** Settings ***
Documentation    USe this layer to get data from external files
Library    ../Libraries/Methods.py


*** Keywords ***
Get CSV Data
    [Arguments]    ${filePath}
    ${Data}=    read csv file    ${filePath}
    [Return]    ${Data}
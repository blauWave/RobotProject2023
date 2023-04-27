*** Settings ***
Documentation                   This Test is to verification adding new customer
Library                         SeleniumLibrary
Resource                        ../Resources/MyDriver.robot
Resource                        ../Resources/PO/Login_def.robot
Resource                        ../Resources/PO/NewCustomer_def.robot
Test Setup                      Open Browser with Base-URL and Browser    ${Url}    ${Browser}
Test Teardown                   Close Browser Session

*** Variables ***
${Url}                          https://automationplayground.com/crm/
#!                              should be written    Chrome , Firefox, Edge      WARN
${Browser}                      Chrome


*** Test Cases ***
Should be able to add new customer
    User should be able to login succesfully
    User should be able to add new customer




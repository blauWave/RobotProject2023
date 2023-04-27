*** Settings ***
Documentation                   This Test is to verification adding new customer
Library                         SeleniumLibrary
Resource                        ../Resources/MyDriver.robot
Resource                        ../Resources/PO/Login_def.robot
Resource                        ../Resources/PO/NewCustomer_def.robot
Test Setup                      Login Browser with Base-URL and Browser    ${Url}    ${Browser}
Test Teardown                   Close Browser Session
Suite Setup                     set screenshot directory    ${output_dir}/Results/Screenshots/NewCustomer/

*** Variables ***
${Url}                          https://automationplayground.com/crm/
#!                              should be written    Chrome , Firefox, Edge      WARN
${Browser}                      Chrome


*** Test Cases ***
User should be able to add new customer
    User clicks link to add new customer
    User fills all the informations
    User clicks the submit button
    User should see "Success! New customer added"





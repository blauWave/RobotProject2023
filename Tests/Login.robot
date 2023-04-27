*** Settings ***
Documentation                   This is some basic info about the whole suite
Library                         SeleniumLibrary
Resource                        ../Resources/MyDriver.robot
Resource                        ../Resources/PO/Login_def.robot
Test Setup                      Open Browser with Base-URL and Browser    ${Url}    ${Browser}
Test Teardown                   Close Browser Session
Suite Setup                     set screenshot directory    ${output_dir}/Results/Screenshots/LoginPage/

*** Variables ***
${Url}                          https://automationplayground.com/crm/
# TODO                          should be written    Chrome , Firefox, Edge
${Browser}                      Chrome

*** Test Cases ***
User should be able to login succesfully
    User clicks link to login
    User puts user name
    User puts password
    User clicks the login button
    User should see "Our Happy Customers"



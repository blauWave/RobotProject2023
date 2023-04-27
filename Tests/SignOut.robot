*** Settings ***
Documentation                   This Test to Validation signinh out
Library                         SeleniumLibrary
Resource                        ../Resources/MyDriver.robot
Resource                        ../Resources/PO/Login_def.robot
Resource                        ../Resources/PO/SignOut_def.robot
Test Setup                      Login Browser with Base-URL and Browser    ${Url}    ${Browser}
Test Teardown                   Close Browser Session
Suite Setup                     set screenshot directory    ${output_dir}/Results/Screenshots/SignOut/
*** Variables ***
${Url}                          https://automationplayground.com/crm/
# TODO                          should be written    Chrome , Firefox, Edge
${Browser}                      Chrome

*** Test Cases ***
Should be able to sign out
    User clicks button "Sign Out"
    User should see "Signed Out"





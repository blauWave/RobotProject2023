*** Settings ***
Documentation                   This Test to Validation signinh out
Library                         SeleniumLibrary
Resource                        ../Resources/MyDriver.robot
Resource                        ../Resources/PO/Login_def.robot
Resource                        ../Resources/PO/SignOut_def.robot
Test Setup                      Open Browser with Base-URL and Browser    ${Url}    ${Browser}
Test Teardown                   Close Browser Session

*** Variables ***
${Url}                          https://automationplayground.com/crm/
# TODO                          should be written    Chrome , Firefox, Edge
${Browser}                      Chrome

*** Test Cases ***
Should be able to sign out
    User should be able to login succesfully
    User should be able to sign out succesfully





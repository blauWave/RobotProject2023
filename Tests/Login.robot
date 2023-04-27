*** Settings ***
Documentation                   This is some basic info about the whole suite
Library                         SeleniumLibrary
Resource                        ../Resources/MyDriver.robot
Resource                        ../Resources/PO/Login_def.robot
Test Setup                      Open Browser with Base-URL and Browser    ${Url}    ${Browser}
Test Teardown                   Close Browser Session

*** Variables ***
${Url}                          https://automationplayground.com/crm/
# TODO                          should be written    Chrome , Firefox, Edge
${Browser}                      Chrome
${email-id}                     admin@robotframeworktutarial.com
${password}                     qwe

*** Test Cases ***
Should be able to login
    [Documentation]             This is some basic infi about test
    [Tags]                      Smoke
    User should be able to login succesfully    ${email-id}       ${password}



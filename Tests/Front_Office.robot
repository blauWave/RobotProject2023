*** Settings ***
Library    SeleniumLibrary

Resource    ../Resources/PO/CommonWeb.robot
Resource    ../Resources/PO/Front_Office_Def.robot
Resource    ../Resources/PO/Landing.robot
Resource    ../Resources/PO/Team.robot
Resource    ../Resources/PO/TopNav.robot

Resource    ../Resources/MyDriver.robot

Test Setup                      Open Browser with Base-URL and Browser    ${Url}    ${Browser}
Test Teardown                   Close Browser Session
Suite Setup                     set screenshot directory    ${output_dir}/Results/Screenshots/FrontOffice/

*** Variables ***
${Url}                          https://automationplayground.com/front-office/
# TODO                          should be written    Chrome , Firefox, Edge
${Browser}                      Chrome

*** Test Cases ***
Opening Browser
    log to console    Abdulkadir


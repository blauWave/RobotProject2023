*** Settings ***
Library    SeleniumLibrary

Resource    ../Resources/PO/CommonWeb.robot
Resource    ../Resources/PO/Front_Office_Def.robot

Resource    ../Resources/MyDriver.robot

Test Setup                      Open Browser with Base-URL and Browser    ${Url}    ${Browser}
Test Teardown                   Close Browser Session
Suite Setup                     set screenshot directory    ${output_dir}/Results/Screenshots/FrontOffice/


# robot -d Results Tests/Front_Office.robot
*** Variables ***
${Url}                          https://automationplayground.com/front-office/
# TODO                          should be written    Chrome , Firefox, Edge
${Browser}                      Chrome

*** Test Cases ***
Should be able to accees Home page
    [Documentation]             This is test 1
    [Tags]                      Test 1
    User goes to landing page

Team page should match requirements
    [Documentation]             This is test 2
    [Tags]                      Test 2
    Go to the "Team" Page

*** Settings ***
Documentation       Using different kinds of variables.
Library    SeleniumLibrary
Library    BuiltIn
Library    Collections
Library    Libraries/Methods.py
Resource    ../Resources/MyDriver.robot
Resource    ../Resources/DataManager.robot

#Test Setup    Open Browser with Base-URL and Browser   ${Url}    ${Browser}
#Test Teardown    Close Browser Session

*** Variables ***

${Url}              https://www.amazon.de
${Browser}          Firefox

*** Test Cases ***
test specific locators
    log to console    abdulkadir
    wait until element is visible    id:sp-cc-accept
    click element    id:sp-cc-accept
    sleep    1s
    mouse over    nav-link-accountList
    mouse over    //*[data-nav-role="signin"]
    sleep    4s

test cace 1
    log to console    Abdulkadir
    wait until element is visible    id:sp-cc-accept
    click element    id:sp-cc-accept
    click link    Bestseller
    wait until page contains    Bestseller in Sport & Freizeit
    input text    id:twotabsearchtextbox    iphoneabdulkad
    click button    id:nav-search-submit-button
    Execute JavaScript    window.scrollTo(0, 15000)    # scroll down
    Sleep    2s
    Execute JavaScript    window.scrollTo(0, 500)    # scroll up
    Sleep    2s
    wait until element is visible    (//*[@class='a-price-whole'])[1]
    @{prices}    Get WebElements    //*[@class='a-price-whole']
    ${countElements}=    get element count    //*[@class='a-price-whole']
    log to console      ${countElements}
    ${price_list}=    Create List
    FOR    ${price}    IN    @{prices}
        ${price_value}=    Get Text    ${price}
        ${number_string}    replace string    ${price_value}   .     ${EMPTY}
        ${number_string}    replace string    ${number_string}    ,     .
        ${number_float}    Convert To Number    ${number_string}
        Append To List    ${price_list}    ${number_float}
    END
    log to console    List:${price_list}

    ${min_price}=    minimum value from list    ${price_list}
    log to console    The minimum price is ${min_price}
    ${item_xpath}=    Set Variable If    '${min_price}' == ''    //*[contains(@class,'s-result-item') and not(contains(@class,'AdHolder'))][1]    (//*[contains(text(),'${min_price}')])[1]
    wait until element is enabled    ${item_xpath}
    scroll element into view    ${item_xpath}
    Click Element    ${item_xpath}/..
    wait until page contains    ${min_price}


Convert Number String to Float
    ${number_string}    Set Variable    1.089,00
    ${number_string}    replace string    ${number_string}    .     ${EMPTY}   # replace comma separator with period separator
    ${number_string}    replace string    ${number_string}    ,     .
    ${number_float}    Convert To Number    ${number_string}
    log to console    ${number_float}

test setting up

    open browser            ${Url}    ${Browser}

test setting up-2
    create webdriver        ${Browser}    executable_path=../Drivers/chromedriver.exe
    go to                   ${Url}

My Test
    [Template]    My Test Template
    1       2       3       4
    5       6       7       8

Reading data from csv file
    ${data}=    Get CSV Data    C:\\Users\\PC\\PycharmProjects\\RobotProject2023\\Data\\Users.csv
    log to console      ${data}



*** Keywords ***
My Test Template
    [Arguments]    ${value1}    ${value2}   ${value3}   ${value4}
    #log to console    ${value1}
    log to console    ${value2}
    log to console    ${value3}
    log to console    ${value4}
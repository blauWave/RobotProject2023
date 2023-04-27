*** Settings ***
Documentation           This is some basic info about the whole suite
Library                 SeleniumLibrary     #auto_close=${FALSE}

*** Variables ***

*** Test Cases ***
Should be able to add new customer
    [Documentation]     This is some basic infi about test
    [Tags]              Smoke
    #initialize Selenium
    set selenium timeout    10s
    set selenium speed      .1s
    log                 Starting the test case!
    open browser        https://automationplayground.com/crm/    chrome
    maximize browser window

    page should contain     Customers Are Priority One!
    #set window position     x=341    y=169
    #set window size         width=1935      height=1090

    click link              css:#SignIn
    page should contain     Login
    input text              email-id        admin@robotframeworktutarial.com
    input text              password        qwe
    click button            Submit
    page should contain    Our Happy Customers

    click link          New Customer
    page should contain    Add Customer
    input text          EmailAddress        xxx@xx.com
    input text          FirstName           Alberto
    input text          LastName            Boniche
    input text          City                PanamaCity
    select from list by label    StateOrRegion    Alabama
    select radio button    gender       male
    select checkbox    name=promos-name
    click button    Submit
    wait until page contains    Success! New customer added.


    sleep               3s
    close browser


*** Settings ***
Library                         SeleniumLibrary
Resource                        ../MyDriver.robot
Resource                        Login_def.robot


*** Variables ***

*** Keywords ***
User should be able to add new customer
    click link                  New Customer
    wait until page contains    Add Customer
    input text                  EmailAddress        xxx@xx.com
    input text                  FirstName           Alberto
    input text                  LastName            Boniche
    input text                  City                PanamaCity
    select from list by label   StateOrRegion    Alabama
    select radio button         gender       male
    select checkbox             name=promos-name
    click button                Submit
    wait until page contains    Success! New customer added.
    sleep                       3s



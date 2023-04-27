*** Settings ***
Library                         SeleniumLibrary
Resource                        ../MyDriver.robot
Resource                        Login_def.robot


*** Variables ***

*** Keywords ***
User clicks link to add new customer
    click link                  New Customer
User fills all the informations
    wait until page contains    Add Customer
    input text                  EmailAddress        xxx@xx.com
    input text                  FirstName           Alberto
    input text                  LastName            Boniche
    input text                  City                PanamaCity
    select from list by label   StateOrRegion    Alabama
    select radio button         gender       male
    select checkbox             name=promos-name
User clicks the submit button
    click button                Submit
User should see "Success! New customer added"
    wait until page contains    Success! New customer added.
    capture page screenshot     newCustomer.png



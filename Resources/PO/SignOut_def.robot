*** Settings ***
Library                             SeleniumLibrary

*** Variables ***
${email-id}                         admin@robotframeworktutarial.com
${password}                         qwe

*** Keywords ***
User should be able to sign out succesfully
    click link                      Sign Out
    wait until page contains        Signed Out


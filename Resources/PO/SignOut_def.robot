*** Settings ***
Library                             SeleniumLibrary

*** Variables ***
${email-id}                         admin@robotframeworktutarial.com
${password}                         qwe

*** Keywords ***
User clicks button "Sign Out"
    click link                      Sign Out
User should see "Signed Out"
    wait until page contains        Signed Out
    capture page screenshot         SignOut.png


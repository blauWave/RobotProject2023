*** Settings ***
Library                             SeleniumLibrary

*** Variables ***
${email-id}                         admin@robotframeworktutarial.com
${password}                         qwe

*** Keywords ***
User should be able to login succesfully
    log                             Starting the test case!
    wait until page contains        Customers Are Priority One!
    click link                      css:#SignIn
    wait until page contains        Login
    input text                      email-id        ${email-id}
    input text                      password        ${password}
    click button                    Submit
    wait until page contains        Our Happy Customers



*** Settings ***
Library                             SeleniumLibrary

*** Variables ***
${email-id}                         admin@robotframeworktutarial.com
${password}                         qwe

*** Keywords ***
User clicks link to login
    log                             Starting the test case!
    wait until page contains        Customers Are Priority One!
    click link                      css:#SignIn
    wait until page contains        Login
User puts user name
    input text                      email-id        ${email-id}
User puts password
    input text                      password        ${password}
User clicks the login button
    click button                    Submit
User should see "Our Happy Customers"
    wait until page contains        Our Happy Customers
    capture page screenshot         LoginPage.png

User should see "Our Happy Customers"-2
    wait until page contains        Our Happy Customers






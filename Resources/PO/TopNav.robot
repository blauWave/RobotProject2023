*** Settings ***
Library    SeleniumLibrary


*** Variables ***


*** Keywords ***
User selects "Team" page
    click link                              Team
    sleep                                   3s
    wait until page contains element        //*[@id="team"]/div/div[1]/div/h2


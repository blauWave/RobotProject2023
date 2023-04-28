*** Settings ***
Library    SeleniumLibrary

Resource    Landing.robot
Resource    Team.robot
Resource    TopNav.robot

*** Variables ***


*** Keywords ***
User goes to landing page
    User is on the Landing Page


Go to the "Team" Page
    User selects "Team" page


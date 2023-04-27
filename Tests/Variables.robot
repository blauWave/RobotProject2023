*** Settings ***
Documentation       Using different kinds of variables.
Library    SeleniumLibrary
Library    BuiltIn
Library    Collections
Resource    ../Resources/MyDriver.robot

#Test Setup    Open Browser with Base-URL    ${Url}
#Test Teardown    Close Browser Session

*** Variables ***

${Url}      https://www.amazon.com

${STRING}           cute cat
${INT_AS_STRING}    1
${INT_AS_INT}       ${1}
${FLOAT}            ${3.14}
@{LIST}             one    two    three
&{DICTIONARY}       string=cat    int=${1}    list=@{LIST}
${ENVIRONMENT}      ${EXECDIR}

${TEMPDIR}

# https://robocorp.com/docs/languages-and-frameworks/robot-framework/variables
*** Test Cases ***
#Create a new Browser with Driver Manager
#    User see the page title on the page

Testing List Variables
    Log Many
    ...    ${STRING}    # cute cat
    ...    ${INT_AS_STRING}    # 1
    ...    ${INT_AS_INT}    # 1
    ...    ${FLOAT}    # 3.14
    ...    ${LIST}    # ['one', 'two', 'three']
    ...    ${LIST}[0]    # one
    ...    ${LIST}[1:]    # ['two', 'three']
    ...    ${DICTIONARY}    # {'string': 'cat', 'int': 1, 'list': ['one', 'two', 'three']}
    ...    ${DICTIONARY}[string]    # cat
    ...    ${DICTIONARY.int}    # 1
    ...    ${DICTIONARY}[list][0]    # one
    ...    ${ENVIRONMENT}    # entrypoints:bin:/Users/<username>/Projects/venv/bin...

Testing List Variables-2
    An example keyword  Abdulkadir  Akyurt

Testing List Variables-3
    A second keyword

Testing List Variables-4
    Loop through scalars

Testing List Variables-5
    Loop through list


*** Keywords ***
User see the page title on the page
    log    User see the page title on the page
    page should contain     Hallo, anmelden


An example keyword
    [Arguments]    ${first_arg}    ${second_arg}
    log to console    Got arguments ${first_arg} and ${second_arg}

A second keyword
    ${as_list}=    Create list    ali    veli
    ${as_dict}=    Create dictionary    first_arg=ahmet    second_arg=mehmet
    # All three of the following will log "Got arguments 1 and 2"
    An example keyword    1    2
    An example keyword    @{as_list}
    An example keyword    &{as_dict}

Loop through scalars
    ${name_one}=    Set variable    John
    ${name_two}=    Set variable    Robert
    FOR    ${name}    IN    ${name_one}    ${name_two}    Mark
        log to console    Name is ${name}
    END

Loop through list
    ${names}=    Create list    John    Robert    Mark
    FOR    ${name}    IN    @{names}
        log to console    Name is ${name}
    END
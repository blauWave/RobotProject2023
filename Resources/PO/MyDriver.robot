*** Settings ***
Library                 SeleniumLibrary
Library                 Collections
Library                 BuiltIn
Library                 DateTime
Library                 String
Library                 ../../Libraries/Driver_Manager.py


*** Variables ***
${text}                 Done! This text is coming from Robot Framework
${environmentToRunTest}    LOCAL

*** Keywords ***
Open Browser with Base-URL
    [Documentation]    Generic test setup to switch between local and Browserstack testsetup
    [Arguments]      ${Url}

    Run Keyword If    '${environmentToRunTest}'=='LOCAL'           ${Driver}    ${Url}     ${Browser}
    ...     ELSE IF   '${environmentToRunTest}'=='BROWSERSTACK'    testSetupBrowserstack    ${Url}
    ...     ELSE IF   '${environmentToRunTest}'=='LAMBDATEST'    testSetupLambdatest    ${Url}
    ...     ELSE      Log       testSetup went wrong. Check the value of the variable 'environmentToRunTest'.



#testSetupBrowserstack
#    [Arguments]      ${Url}
#    ${remoteUrl}                Set Variable        http://${browserstack_userName}:${browserstack_accessKey}@hub.browserstack.com:80/wd/hub
#
#    # Set the Browser default language to GERMAN, so that the assertions will not fail "Bei Ihrem Konto anmelden" instead of "Sign in to your account"
#    # from Lambdatet Chat and https://www.lambdatest.com/blog/internationalization-with-selenium-webdriver/ and https://stackoverflow.com/questions/20808209/how-to-set-browser-language-using-remotewebdriver
#    # @link https://stackoverflow.com/questions/20808209/how-to-set-browser-language-using-remotewebdriver
#    # @link https://www.selenium.dev/documentation/legacy/desired_capabilities/
#    ${list}     Create List   --lang=de
#    ${args}     Create Dictionary   args=${list}
#    ${desiredCapabilities}      Create Dictionary    os=${os}      os_version=${osVersion}     browser=${browser}   browser_version=${browserVersion}   intl.accept_languages=de-de     chromeOptions=${args}
#    LOG    "Firefox kann noch nicht auf DE gesetzt werden. Siehe andere Parameter hier: https://www.lambdatest.com/blog/internationalization-with-selenium-webdriver/"   WARN
#
#    LOG TO CONSOLE    "Öffne URL: ${Url} im Browser ${Browser} über BROWSERSTACK: ${remoteUrl}"
#    open browser    ${Url}    ${Browser}   remote_url=${remoteUrl}     desired_capabilities=${desiredCapabilities}
#    maximize browser window
#
#
#testSetupLambdatest
#    [Arguments]      ${Url}
#    LOG TO CONSOLE  "Starte LAMBDATEST..."
#
#    # Set the Browser default language to GERMAN, so that the assertions will not fail "Bei Ihrem Konto anmelden" instead of "Sign in to your account"
#    # from Lambdatet Chat and https://www.lambdatest.com/blog/internationalization-with-selenium-webdriver/ and https://stackoverflow.com/questions/20808209/how-to-set-browser-language-using-remotewebdriver
#    ${list}     Create List   --lang=de
#    ${args}     Create Dictionary   args=${list}
#    LOG    "Firefox kann noch nicht auf DE gesetzt werden. Siehe andere Parameter hier: https://www.lambdatest.com/blog/internationalization-with-selenium-webdriver/"   WARN
#
#    ${REMOTE_URL}          Set Variable        https://${lambdatest_userName}:${lambdatest_accessKey}@hub.lambdatest.com/wd/hub
#    ${CAPABILITIES}        Create Dictionary    build=${SUITE NAME}   name=${TEST NAME}     platform=${os} ${osVersion}    browserName=${Browser}    version=102.0  intl.accept_languages=de     geoLocation=DE     accept-Language=de     chromeOptions=${args}
#
#    LOG TO CONSOLE  "${REMOTE_URL}"
#    LOG TO CONSOLE  ${CAPABILITIES}
#
#    # open browser    http://www.google.com  ${Browser}  remote_url=${REMOTE_URL}     desired_capabilities=${CAPABILITIES}
#    open browser    ${Url}  ${Browser}  remote_url=${REMOTE_URL}     desired_capabilities=${CAPABILITIES}
#    maximize browser window

testSetupLocal
    [Arguments]      ${Url}     ${Browser}
    open browser    ${Url}    ${Browser}


Close Browser Session
    Run keyword if  '${environmentToRunTest}'=='LAMBDATEST'
    ...  Report Lambdatest Status
    ...  ${TEST_NAME}
    ...  ${TEST_STATUS}
    close all browsers


webdriverManager
    [Arguments]      ${Url}     ${Browser}
    ${chromedriver_path}=    Get Driver Path    ${Browser}
    Create Webdriver    ${Browser}    executable_path=${chromedriver_path}
    Go to  ${Url}


## Loops through all defined browsers and exeuctes one testcase after another in a different browser
## @fixme: Klappt so noch nicht. Muss evtl über den Aufruf in der Konsole (mit PABOT?) gemacht werden.
#testwithseveralbrowser
#    [Arguments]      ${Url}    ${Browser}
#    FOR  ${browser}  IN   @{BROWSERS}
#        log to console    ("Testing ${Url} in Browser: ${browser} ")
#        Run Keyword      webdriverManager        ${Url}    ${browser}
#    END

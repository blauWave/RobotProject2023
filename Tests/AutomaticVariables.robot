*** Settings ***

Library    SeleniumLibrary


*** Test Cases ***
Testing System
#
#Variable	Explanation	Available
#${TEST NAME}	The name of the current test case.	Test case
#@{TEST TAGS}	Contains the tags of the current test case in alphabetical order. Can be modified dynamically using Set Tags and Remove Tags keywords.	Test case
#${TEST DOCUMENTATION}	The documentation of the current test case. Can be set dynamically using using Set Test Documentation keyword.	Test case
#${TEST STATUS}	The status of the current test case, either PASS or FAIL.	Test teardown
#${TEST MESSAGE}	The message of the current test case.	Test teardown
#${PREV TEST NAME}	The name of the previous test case, or an empty string if no tests have been executed yet.	Everywhere
#${PREV TEST STATUS}	The status of the previous test case: either PASS, FAIL, or an empty string when no tests have been executed.	Everywhere
#${PREV TEST MESSAGE}	The possible error message of the previous test case.	Everywhere
#${SUITE NAME}	The full name of the current test suite.	Everywhere
#${SUITE SOURCE}	An absolute path to the suite file or directory.	Everywhere
#${SUITE DOCUMENTATION}	The documentation of the current test suite. Can be set dynamically using using Set Suite Documentation keyword.	Everywhere
#&{SUITE METADATA}	The free metadata of the current test suite. Can be set using Set Suite Metadata keyword.	Everywhere
#${SUITE STATUS}	The status of the current test suite, either PASS or FAIL.	Suite teardown
#${SUITE MESSAGE}	The full message of the current test suite, including statistics.	Suite teardown
#${KEYWORD STATUS}	The status of the current keyword, either PASS or FAIL.	User keyword teardown
#${KEYWORD MESSAGE}	The possible error message of the current keyword.	User keyword teardown
#${LOG LEVEL}	Current log level.	Everywhere
#${OUTPUT FILE}	An absolute path to the output file.	Everywhere
#${LOG FILE}	An absolute path to the log file or string NONE when no log file is created.	Everywhere
#${REPORT FILE}	An absolute path to the report file or string NONE when no report is created.	Everywhere
#${DEBUG FILE}	An absolute path to the debug file or string NONE when no debug file is created.	Everywhere
#${OUTPUT DIR}	An absolute path to the output directory.	Everywhere
#&{OPTIONS}
#A dictionary exposing command line options. The dictionary keys match the command line options and can be accessed both like ${OPTIONS}[key] and ${OPTIONS.key}. Available options:
#
#${OPTIONS.exclude} (--exclude)
#${OPTIONS.include} (--include)
#${OPTIONS.skip} (--skip)
#${OPTIONS.skip_on_failure} (--skiponfailure)
#New in RF 5.0. More options can be exposed later.
*** Settings ***
Library    SeleniumLibrary
Library    BuiltIn


*** Variables ***
${x}        abdulkadir
${y}        abdulkadir


*** Test Cases ***
testing BuiltIn Library
    this two variables should be equal


*** Keywords ***
this two variables should be equal
    should be equal as strings    ${x}  ${y}
    comment    bu bir dogrulama testidir
    ${str1} = 	Catenate 	Hello 	world
    ${str2} = 	Catenate 	SEPARATOR=--- 	Hello 	world
    ${str3} = 	Catenate 	SEPARATOR= 	Hello 	world
    continue for loop
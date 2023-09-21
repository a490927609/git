*** Settings ***
Library    OperatingSystem
Library   SeleniumLibrary

*** Variables ***
${URL}              http://www.baidu.com
${KEYWORD_INPUT}    id=kw
${SEARCH_BUTTON}    id=su
${keyword}          禅道

*** Test Cases ***
1. Baidu Search
    [Documentation]    This is test
    Append To Environment Variable  PATH  /Users/aaron/rd/tool

    Open Baidu
    Input Text          ${KEYWORD_INPUT}    ${keyword}
    Click button        ${SEARCH_BUTTON}
    sleep               2
    ${title}            Get Title
    should contain      ${title}    ${keyword}
    close Browser

2. TestCase
    Should Be Equal    a    a   just a test

*** Keywords ***
Open Baidu
    Open Browser        ${URL}    chrome

*** Settings ***
Library     SeleniumLibrary
#Library    DateTime
#Library    OperatingSystem
#Suite Setup    Set Unique Output Names


*** Variables ***
${BROWSER}      Chrome
${URL}          https://www.automationexercise.com/

*** Keywords ***
Open Web automationexercise
    Set Selenium Speed    1s
    Open Browser    ${URL}    ${BROWSER}    
    Maximize Browser Window

#Set Unique Output Names
    #${timestamp}=    Get Current Date    result_format=%Y%m%d-%H%M%S
    #Set Suite Variable    ${OUTPUT_DIR}    results/${timestamp}
    #Create Directory    ${OUTPUT_DIR}
    #Set Suite Variable    ${OUTPUT_FILE}    ${OUTPUT_DIR}/output
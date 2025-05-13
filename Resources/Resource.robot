*** Settings ***
Library     SeleniumLibrary


*** Variables ***
${BROWSER}      Chrome
${URL}          https://www.automationexercise.com/

*** Keywords ***
Open Web Automation Exercise
    Set Selenium Speed    1s
    Open Browser    ${URL}    ${BROWSER}    
    Maximize Browser Window
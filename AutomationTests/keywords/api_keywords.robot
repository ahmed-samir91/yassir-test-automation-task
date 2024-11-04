*** Settings ***
Library           RequestsLibrary
Library    OperatingSystem


*** Keywords ***
Load Environment Variables
    ${env_var}=    Get Environment Variable     X_API_KEY
    Log To Console    ${env_var}
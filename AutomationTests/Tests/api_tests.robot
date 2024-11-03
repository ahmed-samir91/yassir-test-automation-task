*** Settings ***
Library           RequestsLibrary
Resource        ../keywords/api_keywords.robot

*** Test Cases ***
Get Public APIs List Test
    [Documentation]    Verify that we can get a list of public APIs
    Get Public APIs
    Status Should Be    200
    Should Contain    ${response_body}    "API Name"

Get API Details Test
    [Documentation]    Verify that we can get API details with valid authorization
    Get API Details With Auth    ${api_id}    ${auth_token}
    Status Should Be    200
    Should Contain    ${response_body}    "Expected Detail"

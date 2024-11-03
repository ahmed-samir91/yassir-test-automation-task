*** Settings ***
Library           RequestsLibrary

*** Variables ***
${BASE_URL}      https://api.publicapis.org

*** Keywords ***
Create API Session
    [Arguments]    ${session_name}
    Create Session    ${session_name}    ${BASE_URL}

Get Public APIs
    Create API Session    public_apis
    ${response}=    GET    /entries
    Set Suite Variable    ${response_body}    ${response.json()}

Get API Details With Auth
    [Arguments]    ${api_id}    ${auth_token}
    Create API Session    api_details
    ${response}=    GET With Token    /entries/${api_id}    ${auth_token}
    Set Suite Variable    ${response_body}    ${response.json()}

Status Should Be
    [Arguments]    ${expected_status}
    Should Be Equal As Strings    ${response.status_code}    ${expected_status}

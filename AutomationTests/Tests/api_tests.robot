*** Settings ***
Library    RequestsLibrary
Resource    ../keywords/api_keywords.robot

*** Variables ***
${BASE_URL}    https://api.thedogapi.com/v1


*** Test Cases ***

Get Random Dog Image
    [Documentation]    Test the endpoint that returns a random dog image
    Create Session    dog_api    ${BASE_URL}
    ${response}=    GET On Session    dog_api   /images/search
    Should Be Equal As Numbers    ${response.status_code}    200
    Log    ${response.json()}
    Should Contain    ${response.json()}.['url']    https://cdn2.thedogapi.com/images

Get Dog Breeds
    [Documentation]    Test the endpoint that retrieves all dog breeds
    ${API_KEY}=     Load Environment Variables
    Create Session    dog_api    ${BASE_URL}
    ${headers}=    Create Dictionary    x-api-key=${API_KEY}
    ${response}=    GET On Session    dog_api    /breeds    headers=${headers}
    Should Be Equal As Numbers    ${response.status_code}    200
    Log    ${response.json()}
    Should Contain    ${response.json()}.['name']   Affenpinscher
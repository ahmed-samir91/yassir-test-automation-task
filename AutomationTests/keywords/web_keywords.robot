*** Settings ***
Library           SeleniumLibrary


*** Variables ***
${URL}           https://www.saucedemo.com
${USERNAME}      standard_user
${PASSWORD}      secret_sauce

*** Keywords ***
Open SauceDemo And Login
    Open Browser    ${URL}    chrome
    Input Text    id=username    ${USERNAME}
    Input Text    id=password    ${PASSWORD}
    Click Button    id=login-button

Add Item To Cart
    [Arguments]    ${item_id}
    Click Button    id=add-to-cart-${item_id}

Checkout Process
    Click Button    id=checkout
    Input Text    id=first-name    John
    Input Text    id=last-name    Doe
    Input Text    id=postal-code    12345
    Click Button    id=continue

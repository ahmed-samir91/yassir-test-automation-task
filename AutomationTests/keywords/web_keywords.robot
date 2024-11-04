*** Settings ***
Library           SeleniumLibrary
Resource    ../variables/web_vars.robot


*** Keywords ***
Open SauceDemo And Login
    Open Browser    ${URL}    chrome
    Maximize Browser Window
    Input Text    ${input_username}    ${USERNAME}
    Input Text    ${input_password}   ${PASSWORD}
    Click Button    ${button_login} 

Add Item To Cart
    [Arguments]    ${item_id}
    Click Button    ${add_item}${item_id}

Checkout Process
    Click Element  ${button_shopping_cart} 
    Click Button  ${button_checkout}
    Input Text    ${input_first_name}    John
    Input Text    ${input_last_name}    Doe
    Input Text    ${input_postal_code}    12345
    Click Button    ${button_continue}

Clean Up
    [Arguments]    ${item_id}
    Click Button    ${remove_item}${item_id}

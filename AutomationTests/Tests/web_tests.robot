*** Settings ***
Library           SeleniumLibrary
Resource    ../keywords/web_keywords.robot

*** Variables ***
${item_name}    sauce-labs-backpack   

*** Test Cases ***
Login Test
    [Documentation]    Verify successful login with valid credentials
    Open SauceDemo And Login
    Page Should Contain    Products
    Close Browser

Add to Cart Test
    [Documentation]    Verify that a product can be added to the cart
    Open SauceDemo And Login
    Add Item To Cart    ${item_name}
    Page Should Contain    1
    Clean Up    ${item_name}
    Close Browser

Checkout Test
    [Documentation]    Verify the checkout process
    Open SauceDemo And Login
    Add Item To Cart    ${item_name}
    Checkout Process
    Page Should Contain    Checkout: Overview
    Close Browser

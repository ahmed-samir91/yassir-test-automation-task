*** Settings ***
Resource          ../Keywords/web_keywords.robot

*** Test Cases ***
Login Test
    [Documentation]    Verify successful login with valid credentials
    Open SauceDemo And Login
    Page Should Contain    Products
    Close Browser

Add to Cart Test
    [Documentation]    Verify that a product can be added to the cart
    Open SauceDemo And Login
    Add Item To Cart    sauce-labs-backpack
    Page Should Contain    1
    Close Browser

Checkout Test
    [Documentation]    Verify the checkout process
    Open SauceDemo And Login
    Add Item To Cart    sauce-labs-backpack
    Checkout Process
    Page Should Contain    Checkout: Overview
    Close Browser

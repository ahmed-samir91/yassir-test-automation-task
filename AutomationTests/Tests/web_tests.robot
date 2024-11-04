*** Settings ***
Library           SeleniumLibrary
Resource    ../keywords/web_keywords.robot

*** Variables ***
${item_name}    sauce-labs-backpack   

*** Test Cases ***
Login Test
    [Documentation]    Verify successful login with valid credentials
    Given Open SauceDemo And Login
    When Page Should Contain    Products
    Then Close Browser

Add to Cart Test
    [Documentation]    Verify that a product can be added to the cart
    Given Open SauceDemo And Login
    When Add Item To Cart    ${item_name}
    And Page Should Contain    1
    And Clean Up    ${item_name}
    Then Close Browser

Checkout Test
    [Documentation]    Verify the checkout process
    Given Open SauceDemo And Login
    And Add Item To Cart    ${item_name}
    When Checkout Process
    Then Page Should Contain    Checkout: Overview
    And Close Browser

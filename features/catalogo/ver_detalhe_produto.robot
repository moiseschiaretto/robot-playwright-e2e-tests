*** Settings ***
Documentation    Visualizacao de detalhe de um produto
Resource         ../../resources/keywords/browser_keywords.robot
Resource         ../../resources/keywords/common_steps.robot
Resource         ../../resources/pages/inventory_page.robot
Test Setup       fazer login como usuario padrao
Test Teardown    Finalizar Cenario

*** Test Cases ***
Cenario: Ver detalhe do produto Sauce Labs Backpack
    Given que estou na pagina de produtos
    When clico no produto "Sauce Labs Backpack"
    Then devo ver o detalhe do produto "Sauce Labs Backpack"

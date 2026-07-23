*** Settings ***
Documentation    Adicao de item ao carrinho
Resource         ../../resources/keywords/browser_keywords.robot
Resource         ../../resources/keywords/common_steps.robot
Resource         ../../resources/pages/inventory_page.robot
Resource         ../../resources/pages/cart_page.robot
Test Setup       fazer login como usuario padrao
Test Teardown    Finalizar Cenario

*** Test Cases ***
Cenario: Adicionar produto ao carrinho deve incrementar o badge
    Given que estou na pagina de produtos
    When adiciono o produto "sauce-labs-backpack" ao carrinho
    Then devo ver o badge do carrinho com "1"

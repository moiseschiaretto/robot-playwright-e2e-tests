*** Settings ***
Documentation    Estado inicial do carrinho, sem itens adicionados
Resource         ../../resources/keywords/browser_keywords.robot
Resource         ../../resources/keywords/common_steps.robot
Resource         ../../resources/pages/inventory_page.robot
Resource         ../../resources/pages/cart_page.robot
Test Setup       fazer login como usuario padrao
Test Teardown    Finalizar Cenario

*** Test Cases ***
Cenario: Carrinho deve iniciar vazio para um novo login
    Given que estou na pagina de produtos
    When vou para o carrinho
    Then devo ver o carrinho vazio

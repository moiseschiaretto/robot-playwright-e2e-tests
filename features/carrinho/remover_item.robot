*** Settings ***
Documentation    Remocao de item do carrinho
Resource         ../../resources/keywords/browser_keywords.robot
Resource         ../../resources/keywords/common_steps.robot
Resource         ../../resources/pages/inventory_page.robot
Resource         ../../resources/pages/cart_page.robot
Test Setup       fazer login como usuario padrao
Test Teardown    Finalizar Cenario

*** Test Cases ***
Cenario: Remover produto do carrinho deve esvazia-lo
    Given que estou na pagina de produtos
    And adiciono o produto "sauce-labs-backpack" ao carrinho
    When vou para o carrinho
    And removo o produto "sauce-labs-backpack" do carrinho
    Then devo ver o carrinho vazio

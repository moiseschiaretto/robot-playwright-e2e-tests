*** Settings ***
Documentation    Finalizacao da compra
Resource         ../../resources/keywords/browser_keywords.robot
Resource         ../../resources/keywords/common_steps.robot
Resource         ../../resources/pages/inventory_page.robot
Resource         ../../resources/pages/cart_page.robot
Resource         ../../resources/pages/checkout_page.robot
Test Setup       fazer login como usuario padrao
Test Teardown    Finalizar Cenario

*** Test Cases ***
Cenario: Finalizar compra deve concluir o pedido
    Given que estou na pagina de produtos
    And adiciono o produto "sauce-labs-backpack" ao carrinho
    And vou para o carrinho
    And inicio o checkout
    And informo os dados "Moises", "Chiaretto", "80000-000" no checkout
    And continuo o checkout
    When finalizo a compra
    Then devo ver a confirmacao da compra

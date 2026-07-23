*** Settings ***
Documentation    Pos-condicao apos confirmacao da compra: carrinho deve ser resetado
Resource         ../../resources/keywords/browser_keywords.robot
Resource         ../../resources/keywords/common_steps.robot
Resource         ../../resources/pages/inventory_page.robot
Resource         ../../resources/pages/cart_page.robot
Resource         ../../resources/pages/checkout_page.robot
Test Setup       fazer login como usuario padrao
Test Teardown    Finalizar Cenario

*** Test Cases ***
Cenario: Apos confirmar a compra o carrinho deve ficar vazio
    Given que estou na pagina de produtos
    And adiciono o produto "sauce-labs-backpack" ao carrinho
    And vou para o carrinho
    And inicio o checkout
    And informo os dados "Moises", "Chiaretto", "80000-000" no checkout
    And continuo o checkout
    And finalizo a compra
    When devo ver a confirmacao da compra
    And vou para o carrinho
    Then devo ver o carrinho vazio

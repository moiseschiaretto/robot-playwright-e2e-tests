*** Settings ***
Documentation    Validacao de campo obrigatorio ausente no checkout
Resource         ../../resources/keywords/browser_keywords.robot
Resource         ../../resources/keywords/common_steps.robot
Resource         ../../resources/pages/inventory_page.robot
Resource         ../../resources/pages/cart_page.robot
Resource         ../../resources/pages/checkout_page.robot
Test Setup       fazer login como usuario padrao
Test Teardown    Finalizar Cenario

*** Test Cases ***
Cenario: Checkout sem nome preenchido deve exibir erro
    Given que estou na pagina de produtos
    And adiciono o produto "sauce-labs-backpack" ao carrinho
    And vou para o carrinho
    And inicio o checkout
    When informo os dados "", "Chiaretto", "80000-000" no checkout
    And continuo o checkout
    Then devo ver o erro de campo obrigatorio "First Name is required"

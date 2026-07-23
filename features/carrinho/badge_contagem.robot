*** Settings ***
Documentation    Contagem do badge do carrinho com multiplos itens
Resource         ../../resources/keywords/browser_keywords.robot
Resource         ../../resources/keywords/common_steps.robot
Resource         ../../resources/pages/inventory_page.robot
Resource         ../../resources/pages/cart_page.robot
Test Setup       fazer login como usuario padrao
Test Teardown    Finalizar Cenario

*** Test Cases ***
Cenario: Badge do carrinho deve refletir dois produtos adicionados
    Given que estou na pagina de produtos
    When adiciono o produto "sauce-labs-backpack" ao carrinho
    And adiciono o produto "sauce-labs-bike-light" ao carrinho
    Then devo ver o badge do carrinho com "2"

*** Settings ***
Documentation    Ordenacao de produtos por preco
Resource         ../../resources/keywords/browser_keywords.robot
Resource         ../../resources/keywords/common_steps.robot
Resource         ../../resources/pages/inventory_page.robot
Test Setup       fazer login como usuario padrao
Test Teardown    Finalizar Cenario

*** Test Cases ***
Cenario: Ordenar produtos por preco crescente
    Given que estou na pagina de produtos
    When ordeno os produtos por "lohi"
    Then devo ver os produtos ordenados por preco crescente

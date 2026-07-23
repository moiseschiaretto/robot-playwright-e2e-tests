*** Settings ***
Documentation    Listagem de produtos no catalogo
Resource         ../../resources/keywords/browser_keywords.robot
Resource         ../../resources/keywords/common_steps.robot
Resource         ../../resources/pages/inventory_page.robot
Test Setup       fazer login como usuario padrao
Test Teardown    Finalizar Cenario

*** Test Cases ***
Cenario: Listar produtos deve exibir o catalogo completo
    Given que estou na pagina de produtos
    Then devo ver a lista de produtos

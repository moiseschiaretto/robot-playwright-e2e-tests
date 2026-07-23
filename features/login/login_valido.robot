*** Settings ***
Documentation    Login com credenciais validas - fluxo feliz
Resource         ../../resources/keywords/browser_keywords.robot
Resource         ../../resources/pages/login_page.robot
Test Teardown    Finalizar Cenario

*** Test Cases ***
Cenario: Login com credenciais validas
    Given que estou na pagina de login do SauceDemo
    When informo o usuario "standard_user" e a senha "secret_sauce"
    And clico no botao de entrar
    Then devo ver a pagina de produtos

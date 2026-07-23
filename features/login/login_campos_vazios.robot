*** Settings ***
Documentation    Login com campos vazios
Resource         ../../resources/keywords/browser_keywords.robot
Resource         ../../resources/pages/login_page.robot
Test Teardown    Finalizar Cenario

*** Test Cases ***
Cenario: Login sem informar usuario deve ser negado
    Given que estou na pagina de login do SauceDemo
    When informo apenas a senha "secret_sauce", sem usuario
    And clico no botao de entrar
    Then devo ver a mensagem de erro "Username is required"

*** Settings ***
Documentation    Login com senha incorreta
Resource         ../../resources/keywords/browser_keywords.robot
Resource         ../../resources/pages/login_page.robot
Test Teardown    Finalizar Cenario

*** Test Cases ***
Cenario: Login com senha incorreta deve ser negado
    Given que estou na pagina de login do SauceDemo
    When informo o usuario "standard_user" e a senha "senha-errada-de-proposito"
    And clico no botao de entrar
    Then devo ver a mensagem de erro "Username and password do not match"

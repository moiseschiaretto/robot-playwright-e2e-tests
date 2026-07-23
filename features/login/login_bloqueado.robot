*** Settings ***
Documentation    Login com usuario bloqueado - cenario de negacao de acesso
Resource         ../../resources/keywords/browser_keywords.robot
Resource         ../../resources/pages/login_page.robot
Test Teardown    Finalizar Cenario

*** Test Cases ***
Cenario: Login com usuario bloqueado deve ser negado
    Given que estou na pagina de login do SauceDemo
    When informo o usuario "locked_out_user" e a senha "secret_sauce"
    And clico no botao de entrar
    Then devo ver a mensagem de erro "Sorry, this user has been locked out"

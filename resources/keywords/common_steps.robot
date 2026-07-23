*** Settings ***
Resource    ../pages/login_page.robot

*** Keywords ***
fazer login como usuario padrao
    [Documentation]    Pre-condicao reutilizada por Catalogo, Carrinho e Checkout: autentica como standard_user
    que estou na pagina de login do SauceDemo
    informo o usuario "standard_user" e a senha "secret_sauce"
    clico no botao de entrar
    devo ver a pagina de produtos

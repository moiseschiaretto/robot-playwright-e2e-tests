*** Settings ***
Library     Browser
Resource    ../variables.robot

*** Keywords ***
que estou na pagina de login do SauceDemo
    Go To    ${BASE_URL}
    Wait For Elements State    id=user-name    visible

informo o usuario "${usuario}" e a senha "${senha}"
    Fill Text    id=user-name    ${usuario}
    Fill Text    id=password    ${senha}

informo apenas o usuario "${usuario}", sem senha
    Fill Text    id=user-name    ${usuario}

informo apenas a senha "${senha}", sem usuario
    Fill Text    id=password    ${senha}

clico no botao de entrar
    Click    id=login-button

devo ver a pagina de produtos
    Wait For Elements State    css=.inventory_list    visible
    Get Url    ==    ${BASE_URL}/inventory.html

devo ver a mensagem de erro "${mensagem_esperada}"
    Get Text    css=[data-test="error"]    contains    ${mensagem_esperada}

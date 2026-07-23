*** Settings ***
Library     Browser
Resource    ../variables.robot

*** Keywords ***
inicio o checkout
    Click    id=checkout

informo os dados "${nome}", "${sobrenome}", "${cep}" no checkout
    Fill Text    id=first-name    ${nome}
    Fill Text    id=last-name    ${sobrenome}
    Fill Text    id=postal-code    ${cep}

continuo o checkout
    Click    id=continue

devo ver o erro de campo obrigatorio "${mensagem_esperada}"
    Get Text    css=[data-test="error"]    contains    ${mensagem_esperada}

devo ver o resumo do pedido
    Wait For Elements State    css=.summary_info    visible
    Get Url    contains    checkout-step-two

devo ver o total do pedido
    ${total_texto}=    Get Text    css=.summary_total_label
    Should Contain    ${total_texto}    Total

finalizo a compra
    Click    id=finish

devo ver a confirmacao da compra
    Wait For Elements State    css=.complete-header    visible
    Get Text    css=.complete-header    ==    Thank you for your order!

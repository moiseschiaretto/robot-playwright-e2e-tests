*** Settings ***
Library     Browser
Resource    ../variables.robot

*** Keywords ***
adiciono o produto "${id_produto}" ao carrinho
    Click    id=add-to-cart-${id_produto}

devo ver o badge do carrinho com "${quantidade_esperada}"
    Get Text    css=.shopping_cart_badge    ==    ${quantidade_esperada}

vou para o carrinho
    Click    css=.shopping_cart_link
    Wait For Elements State    css=.cart_list    visible

removo o produto "${id_produto}" do carrinho
    Click    id=remove-${id_produto}

devo ver o carrinho vazio
    ${quantidade}=    Get Element Count    css=.cart_item
    Should Be Equal As Integers    ${quantidade}    0

devo ver o produto "${nome_produto}" no carrinho
    Get Text    css=.cart_item    contains    ${nome_produto}

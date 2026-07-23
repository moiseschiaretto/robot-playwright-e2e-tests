*** Settings ***
Library     Browser
Library     Collections
Library     String
Resource    ../variables.robot

*** Keywords ***
que estou na pagina de produtos
    Wait For Elements State    css=.inventory_list    visible

devo ver a lista de produtos
    ${quantidade}=    Get Element Count    css=.inventory_item
    Should Be True    ${quantidade} > 0

ordeno os produtos por "${criterio}"
    # Valores aceitos pelo dropdown nativo do SauceDemo: az, za, lohi, hilo
    Select Options By    css=[data-test="product-sort-container"]    value    ${criterio}

devo ver os produtos ordenados por preco crescente
    @{elementos}=    Get Elements    css=.inventory_item_price
    @{precos}=    Create List
    FOR    ${elemento}    IN    @{elementos}
        ${texto}=    Get Text    ${elemento}
        ${valor_texto}=    Remove String    ${texto}    $
        ${valor_numero}=    Convert To Number    ${valor_texto}
        Append To List    ${precos}    ${valor_numero}
    END
    @{precos_ordenados}=    Copy List    ${precos}
    Sort List    ${precos_ordenados}
    Should Be Equal    ${precos}    ${precos_ordenados}

clico no produto "${nome_produto}"
    Click    css=.inventory_item_name >> text=${nome_produto}

devo ver o detalhe do produto "${nome_produto}"
    Wait For Elements State    css=.inventory_details_name    visible
    Get Text    css=.inventory_details_name    ==    ${nome_produto}

*** Settings ***
Library     Browser
Library     DateTime
Library     String
Resource    ../variables.robot

*** Keywords ***
Abrir Navegador Para Testes
    [Documentation]    Suite Setup padrao: abre o navegador uma unica vez para toda a execucao
    New Browser    ${BROWSER}    headless=${HEADLESS}
    New Context    viewport={'width': 1366, 'height': 768}
    New Page    ${BASE_URL}

Fechar Navegador Apos Testes
    [Documentation]    Suite Teardown padrao: fecha o navegador ao final de toda a execucao
    Close Browser    ALL

Capturar Print Do Cenario
    [Documentation]    Captura print de CADA cenario (independente de passar ou falhar),
    ...    nomeado com data/hora da execucao, salvo em evidencias/ na raiz do projeto
    ${timestamp}=    Get Current Date    result_format=%Y%m%d_%H%M%S
    ${nome_arquivo}=    Replace String    ${TEST NAME}    ${SPACE}    _
    ${nome_arquivo}=    Replace String    ${nome_arquivo}    :    ${EMPTY}
    Take Screenshot    filename=${CURDIR}/../../evidencias/${timestamp}_${nome_arquivo}.png

Resetar Sessao Apos Cenario
    [Documentation]    Limpa localStorage/sessionStorage do navegador ao final do cenario, garantindo
    ...    carrinho e sessao limpos para o proximo cenario, sem fechar/reabrir o navegador e sem
    ...    depender de nenhum botao de menu (evita espera desnecessaria em cenarios de login negativo,
    ...    onde nao ha menu disponivel).
    Evaluate JavaScript    ${None}    () => { localStorage.clear(); sessionStorage.clear(); }

Finalizar Cenario
    [Documentation]    Test Teardown padrao: captura print e reseta a sessao, nesta ordem
    Capturar Print Do Cenario
    Resetar Sessao Apos Cenario

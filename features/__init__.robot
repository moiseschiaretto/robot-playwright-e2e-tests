*** Settings ***
Documentation    Abre o navegador uma unica vez para toda a execucao (nao mais por cenario/arquivo)
Resource         ../resources/keywords/browser_keywords.robot
Suite Setup      Abrir Navegador Para Testes
Suite Teardown   Fechar Navegador Apos Testes

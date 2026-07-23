*** Variables ***
${BASE_URL}                 %{BASE_URL=https://www.saucedemo.com}
${BROWSER}                  %{BROWSER=chromium}
${HEADLESS}                 %{HEADLESS=False}

# Senha unica para todos os usuarios de demonstracao do SauceDemo
${SENHA_PADRAO}             secret_sauce

# Perfis de usuario (documentacao oficial do site)
${USUARIO_PADRAO}           standard_user
${USUARIO_BLOQUEADO}        locked_out_user
${USUARIO_PROBLEMA}         problem_user
${USUARIO_LENTO}            performance_glitch_user

${LOGS_DIR}                 ${CURDIR}/../logs

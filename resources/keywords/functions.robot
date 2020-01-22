*** Settings ***
Documentation       Nesse arquivo contém funções que serão utilizadas na automação dos testes.


***Keywords***
#Aguarda o componente ser apresentado na tela.
aguardar 
    [Arguments]        ${XPATH}
    wait until element is visible       ${XPATH}

#Verifica se a página contém o componente (Passar seletor do componente).
verifica
    [Arguments]        ${XPATH}
    wait until page contains element    ${XPATH}
#Aguarda o componente ser apresentado na tela e após apresentado clica no componente (Passar seletor do componente).
aguardar e clicar no componente
    [Arguments]        ${XPATH}
    wait until keyword succeeds  10s  0.1s  click element  ${XPATH}

#Aguarda o componente ser apresentado na tela e após apresentado preenche o componente (Passar seletor e texto).
aguardar e preencher o campo
    [Arguments]       ${XPATH}        ${TEXTO}
    wait until keyword succeeds  10s  0.1s  input text  ${XPATH}   ${TEXTO}

#Aguarda o componente ser apresentado na tela e pressiona as teclas (Passar seletor e teclas)
aguardar e pressionar as teclas no componente
    [Arguments]      ${XPATH}         ${TECLA}
    wait until keyword succeeds  10s  0.1s  press key  ${XPATH}  ${TECLA}

#Captura a mensagem de alerta.
Então o sistema exibirá a mensagem "! Insira um número"
    capture page screenshot            somenteNumeros.png
#Verifica validação.



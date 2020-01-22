*** Settings ***
Library                 String
Library                 SeleniumLibrary
Library                 DateTime
Library                 OperatingSystem
Library                 FakerLibrary    locale=pt_BR
Resource                ../keywords/functions.robot
Resource                ../authentication/user-passwords.robot
Resource                ../elements/elements_home.robot
Documentation           Para executar os testes sem abrir o browser é só descomentar a variável e comentar a de baixo. 

*** Variables ***
${DEFAULT_URL}          https://calculadoratriangulo.herokuapp.com
#${BROWSER}              headlesschorme
${BROWSER}              chrome
${AUX}

*** Keywords ***
# Setup e Teardow
Abrir navegador e acessar o sistema.
    Open Browser     ${DEFAULT_URL}     ${BROWSER}
    Set Selenium Implicit Wait  4
    set selenium speed  0.2
    Maximize Browser Window
    Title Should Be  Calculadora de Triângulos


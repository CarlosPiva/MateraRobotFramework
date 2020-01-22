*** Settings ***
Resource                ../resources/keywords/start.robot
Resource                ../resources/keywords/resource.robot
Suite Setup             Abrir navegador e acessar o sistema.
Suite Teardown          Close Browser

Documentation           Nesse arquivo contém todos os cenários de testes.
...                     Através das [Tags] eu consigo executar um teste específico, facilitando testes de micros serviços.                       

*** Test Cases ***

Cenário de Teste: Calcular Triângulo Equilátero.
    [Tags]      equilatero
    Dado que preenchi os 3 campos com o mesmo valor
    Quando clicar no botão Calcular
    Então o sistema exibirá a mensagem "Triângulo Equilátero" e sua imagem

Cenário de Teste: Calcular Triângulo Isósceles informando valore iguais nos Campos "Lado1" e "Lado2"
    [Tags]      isosceles
    Dado que preenchi o campo "Lado1"
    E o campo "Lado2" com valores iguais
    Mas o campo "Lado3" com valor diferente
    Quando clicar no botão Calcular
    Então o sistema exibirá a mensagem "Triângulo Isósceles" e sua imagem

Cenário de Teste: Calcular Triângulo Isósceles informando valore iguais nos Campos "Lado1" e "Lado3"
    [Tags]      isosceles
    Dado que preenchi o campo "Lado1"
    E o campo "Lado3" com valores iguais
    Mas o campo "Lado2" com valor diferente
    Quando clicar no botão Calcular
    Então o sistema exibirá a mensagem "Triângulo Isósceles" e sua imagem

Cenário de Teste: Calcular Triângulo Isósceles informando valore iguais nos Campos "Lado2" e "Lado3"
    [Tags]      isosceles
    Dado que preenchi o campo "Lado2"
    E o campo "Lado3" com valores iguais
    Mas o campo "Lado1" com valor diferente
    Quando clicar no botão Calcular
    Então o sistema exibirá a mensagem "Triângulo Isósceles" e sua imagem

Cenário de Teste: Calcular Triângulo Escaleno.
    [Tags]      escaleno
    Dado que preenchi 3 valores diferentes
    Quando clicar no botão Calcular
    Então o sistema exibirá a mensagem "Triângulo Escaleno" e sua imagem

#--------------------------Validações-----------------------------------------------------------------

Cenário de Teste: Validar preenchimento de todos os campos.
    [Tags]      camposObrigatorios
    Dado que não preenchi nenhum campo
    Quando clicar no botão Calcular
    Então o sistema exibirá a mensagem "Preencha todos os lados"

Cenário de Teste: Validar o preenchimento do campo 1 e 2.
    [Tags]      camposObrigatorios
    Dado que não preenchi o campo 1 e campo 2
    Quando clicar no botão Calcular
    Então o sistema exibirá a mensagem "Preencha todos os lados"

Cenário de Teste: Validar o preenchimento do campo 1 e 3.
    [Tags]      camposObrigatorios
    Dado que não preenchi o campo 1 e campo 3
    Quando clicar no botão Calcular
    Então o sistema exibirá a mensagem "Preencha todos os lados"

Cenário de Teste: Validar o preenchimento do campo 2 e 3.
    [Tags]      camposObrigatorios
    Dado que não preenchi o campo 2 e campo 3
    Quando clicar no botão Calcular
    Então o sistema exibirá a mensagem "Preencha todos os lados"

Cenário de Teste: Validar se o campo aceita caracteres e caracteres especiais.
    [Tags]      somenteNumero
    Dado que preenchi os 3 campos com letras e caracteres especiais
    Quando clicar no botão Calcular
    Então o sistema exibirá a mensagem "! Insira um número"

Cenário de Teste: Validar se o valor informado é maior do que 0 (zero).
    [Tags]      maiorQueZero
    Dado que preenchi os 3 campos com números inferiores a 1
    Quando clicar no botão Calcular
    Então o sistema exibirá a mensagem "Preencha os campos com número superior a 0"














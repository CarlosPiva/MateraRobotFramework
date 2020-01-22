*** Settings ***
Resource                ../data_bases/data_base.robot
Library                 FakerLibrary  locale=pt_BR

Documentation           Nesse arquivo contém o código da automação dos testes.

*** Keywords ***
#Cenário de Teste: Calcular Triângulo Equilátero.
Dado que preenchi os 3 campos com o mesmo valor
    #Preenchendo campo "Lado1"
    aguardar e preencher o campo      ${CAMPOS[0]}      ${equilatero[0]}
    #Preenchendo campo "Lado2"
    aguardar e preencher o campo      ${CAMPOS[1]}      ${equilatero[1]}
    #Preenchendo campo "Lado3"
    aguardar e preencher o campo      ${CAMPOS[2]}      ${equilatero[2]}
Quando clicar no botão Calcular
    #Clique no botão "Calcular"
    aguardar e clicar no componente   ${BTN_CALCULAR}
Então o sistema exibirá a mensagem "Triângulo Equilátero" e sua imagem
    #verifico se a mensagem está correta
    wait until element contains      ${CAMPOS[3]}       Triângulo Equilátero      
    ${Msg_Sucesso_Equilatero}=       get text           ${CAMPOS[3]}
    log                              ${Msg_Sucesso_Equilatero}
    capture page screenshot          equilatero.png

#Cenário de Teste: Calcular Triângulo Isósceles informando um valor igual no lado 1 e lado 2.
Dado que preenchi o campo "Lado1"
    aguardar e preencher o campo      ${CAMPOS[0]}      ${isosceles[0]}
E o campo "Lado2" com valores iguais
    aguardar e preencher o campo      ${CAMPOS[1]}      ${isosceles[1]}
Mas o campo "Lado3" com valor diferente
    aguardar e preencher o campo      ${CAMPOS[2]}      ${isosceles[2]}
Então o sistema exibirá a mensagem "Triângulo Isósceles" e sua imagem
    wait until element contains      ${CAMPOS[3]}       Triângulo Isósceles     
    ${Msg_Sucesso_Isosceles}=        get text           ${CAMPOS[3]}
    log                              ${Msg_Sucesso_Isosceles}
    capture page screenshot          isosceles.png

#Cenário de Teste: Calcular Triângulo Isósceles informando valores iguais no lado 1 e lado 3.
E o campo "Lado3" com valores iguais
    aguardar e preencher o campo      ${CAMPOS[2]}      ${isosceles[1]}
Mas o campo "Lado2" com valor diferente
    aguardar e preencher o campo      ${CAMPOS[1]}      ${isosceles[2]}

#Cenário de Teste: Calcular Triângulo Isósceles informando valores iguais no lado 2 e lado 3.
Dado que preenchi o campo "Lado2"
    aguardar e preencher o campo      ${CAMPOS[1]}      ${isosceles[0]}
Mas o campo "Lado1" com valor diferente
    aguardar e preencher o campo      ${CAMPOS[0]}      ${isosceles[2]}

#Cenário de Teste: Calcular Triângulo Escaleno.
Dado que preenchi 3 valores diferentes
    #Preenchendo campo "Lado1" gerando valores através da LibraryFaker
    ${valor1}=                        FakerLibrary.random Number  digits=2
    aguardar e preencher o campo      ${CAMPOS[0]}      ${valor1}
    #Preenchendo campo "Lado2" gerando valores através da LibraryFaker
    ${valor2}=                        FakerLibrary.random Number  digits=2
    aguardar e preencher o campo      ${CAMPOS[1]}      ${valor2
    #Preenchendo campo "Lado3" gerando valores através da LibraryFaker
    ${valor3}=                        FakerLibrary.random Number  digits=2
    aguardar e preencher o campo      ${CAMPOS[2]}      ${valor3}
Então o sistema exibirá a mensagem "Triângulo Escaleno" e sua imagem
    wait until element contains      ${CAMPOS[3]}       Triângulo Escaleno     
    ${Msg_Sucesso_Escaleno}=        get text           ${CAMPOS[3]}
    log                              ${Msg_Sucesso_Escaleno}
    capture page screenshot          escaleno.png

#Cenário de Teste: Validar preenchimento de todos os campos.
Dado que não preenchi nenhum campo
    capture page screenshot     camposVazios.png
Então o sistema exibirá a mensagem "Preencha todos os lados"
    wait until element contains      ${CAMPOS[3]}      Preencha todos os lados     
    ${Msg_Campos_Vazios}=            get text           ${CAMPOS[3]}
    log                              ${Msg_Campos_Vazios}
    capture page screenshot          ValidaCampos.png

#Cenário de Teste: Validar o preenchimento do campo 1 e 2.
Dado que não preenchi o campo 1 e campo 2
    #Preenchendo somente campo "Lado3"
    aguardar e preencher o campo      ${CAMPOS[2]}      ${equilatero[2]}

#Cenário de Teste: Validar o preenchimento do campo 1 e 3.
Dado que não preenchi o campo 1 e campo 3
    #Preenchendo somente campo "Lado2"
    aguardar e preencher o campo      ${CAMPOS[1]}      ${equilatero[1]}
#Cenário de Teste: Validar o preenchimento do campo 2 e 3.
Dado que não preenchi o campo 2 e campo 3
    #Preenchendo somente campo "Lado1"
    aguardar e preencher o campo      ${CAMPOS[0]}      ${equilatero[0]}

#Cenário de Teste: Validar se o campo aceita caracteres e caracteres especiais.
Dado que preenchi os 3 campos com letras e caracteres especiais
    FOR  ${auxiliar}  IN RANGE  0  3
        #Preenchendo os campos com letras e caracteres especiais.
        aguardar e preencher o campo      ${CAMPOS[${auxiliar}]}      ${letras[${auxiliar}]}
        log                               ${letras[${auxiliar}]}   
        Quando clicar no botão Calcular
        Então o sistema exibirá a mensagem "! Insira um número" 
        aguardar e preencher o campo      ${CAMPOS[${auxiliar}]}      4
    END

#Cenário de Teste: Validar se o valor informado é maior do que 0 (zero).
Dado que preenchi os 3 campos com números inferiores a 1
    FOR  ${x}  IN RANGE  0  3
        #Preenchendo campo "Lado1"
        aguardar e preencher o campo      ${CAMPOS[0]}      ${invalido[${x}]}
        #Preenchendo campo "Lado2"
        aguardar e preencher o campo      ${CAMPOS[1]}      ${invalido[${x}]}
        #Preenchendo campo "Lado3"
        aguardar e preencher o campo      ${CAMPOS[2]}      ${invalido[${x}]}
        Quando clicar no botão Calcular
    END
Então o sistema exibirá a mensagem "Preencha os campos com número superior a 0"
    wait until element contains      ${CAMPOS[3]}       Preencha os campos com número superior a 0                 
    ${Msg_Valores_Invalidos}=        get text           ${CAMPOS[3]}
    log                              ${Msg_Campos_Vazios}
    capture page screenshot          ValorInvalido.png

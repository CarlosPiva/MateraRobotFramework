***Settings***
Documentation       Nesse arquivo contém os xpath, seletores e ids das páginas que seram testadas, facilitando a manutenção futura do código.
...                 Padrão adotado para criação de variáveis ou vetores referentes aos ELEMENTOS das páginas é escrever em CAIXA ALTA.
...                 
*** Variables ***
@{CAMPOS}   
#xpath Lado2    [0] 
...                 xpath=/html/body/form/div/input[1]  
#xpath Lado2    [1]
...                 xpath=/html/body/form/div/input[2] 
#xpath Lado3    [2]
...                 xpath=/html/body/form/div/input[3]
#xpath Mensagem [3]
...                 xpath=/html/body/form/div/h3    

${BTN_CALCULAR}     xpath=/html/body/form/div/input[4]





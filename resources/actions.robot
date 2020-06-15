*** Settings ***
Documentation    Actions é o arquivo que terá keywords que implementam os steps

Library    SeleniumLibrary
Library    OperatingSystem

Resource    pages/BasePage.robot
Resource    pages/Sidebar.robot
Resource    pages/ProdutosPage.robot
Resource    pages/CarrinhoComprasPage.robot

*** Keywords ***
### Helpers
Get Product Json
    [Arguments]     ${file_name}

    ${file}=    Get File    resources/fixtures/${file_name}
    ${json}=    Evaluate    json.loads($file)          json

    [return]    ${json}

### Produtos
Dado que eu tenho um produto para consultar
    [Arguments]     ${file_name}

    ${product_json}=    Get Product Json      ${file_name}  
    Set Test Variable         ${product_json}

Quando eu faço a consulta desse produto
    Consulta Produto        ${product_json}

Então devo ver alguns itens na páginas
    Retornar informações da consulta

Então devo ver mensagem
    Wait Until Element Is Visible    xpath://*[@id='center_column']/p
    Wait Until Element Contains      xpath://*[@id='center_column']/p          No results were found for your search "${product_json['name']}"

### Carrinho Compras

Quando acesso o carrinho
    Acesso Carrinho Compras

Então devo ver mensagem do carrinho vazio
    Wait Until Element Is Visible    xpath://*[@class='alert alert-warning']
    Wait Until Element Contains      xpath://*[@class='alert alert-warning']          Your shopping cart is empty.

Inserir produto no carrinho

    Inserir um produto carrinho

E desejo finalizar a compras
    Ir para para pagamento

Então devo ver dados da compra
    Visualizar itens carrinho compras

E desejo continuar comprando
    Ir para lista de produtos

Então devo inserir o produto no carrinho e retornar para lista de produtos
    Verificar produto incluído no carrinho

Dado que eu tenho um produto no carrinho
    [Arguments]     ${file_name}
    Dado que eu tenho um produto para consultar   ${file_name}
    Quando eu faço a consulta desse produto
    Inserir produto no carrinho
    E desejo continuar comprando

Desejo excluir o produto
    Click Element    xpath://*[@class='cart_delete text-center']/div

### Menu

Dado que desejo verificar os itens do menu "${menu}"

    Run Keyword if      "${menu}" == "woman"
    ...     Validar Menu Woman

    Run Keyword if      "${menu}" == "dresses"
    ...     Validar Menu Dresses
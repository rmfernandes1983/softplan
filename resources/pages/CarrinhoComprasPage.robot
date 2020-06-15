*** Settings ***
Documentation       Este arquivo implementa funções e elementos da página do carrinho de produtos

*** Keywords ***
Acesso Carrinho Compras
    Wait Until Element Is Visible       xpath://*[@class='col-sm-4 clearfix']/div/a
    Click Element                       xpath://*[@class='col-sm-4 clearfix']/div/a

Inserir um produto carrinho
    Sleep   1
    Wait Until Element Is Visible        xpath://*[@class='button ajax_add_to_cart_button btn btn-default']
    Click Element                        xpath://*[@class='button ajax_add_to_cart_button btn btn-default']

Ir para para pagamento
    Sleep   1
    Wait Until Element Is Visible        xpath://*[@class='btn btn-default button button-medium']
    Click Element                        xpath://*[@class='btn btn-default button button-medium']

Ir para lista de produtos
    Sleep   1
    Wait Until Element Is Visible        xpath://*[@class='continue btn btn-default button exclusive-medium']
    Click Element                        xpath://*[@class='continue btn btn-default button exclusive-medium']

Visualizar itens carrinho compras
    Wait Until Element Is Visible        xpath://*[@class='price special-price']
    ${preco_unitario}=              Get Text       xpath://*[@class='price special-price']
    Log                             Preço unitário: ${preco_unitario}
    ${preco_total}=                 Get Text       xpath://*[@id='total_product_price_5_19_0']
    Log                             Preço total produto: ${preco_total}
    ${quantidade}=                  Get Value       xpath://*[@class='cart_quantity text-center']/input[2]
    Log                             Quantidade produto: ${quantidade}

    ${total_compra}=                Get Text       id:total_price
    Log                             Quantidade produto: ${total_compra}

Verificar produto incluído no carrinho
    Wait Until Element Is Visible        xpath://*[@class='shopping_cart']/a/span
    ${quantidade_produto_carrinho}=      Get Text          xpath://*[@class='shopping_cart']/a/span

    Run Keyword if      "${quantidade_produto_carrinho}" == "1"
    ...     Log         ${quantidade_produto_carrinho}




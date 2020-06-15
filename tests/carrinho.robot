*** Settings ***
Documentation       Carrinho de compras...

Resource    ../resources/actions.robot

Suite Setup     Open Session
Suite Teardown  Close Session

Test Teardown   After Test

*** Test Cases ***
Carrinho vazio
    Quando acesso o carrinho
    Então devo ver mensagem do carrinho vazio

Adicionar um produto ao carrinho e continuar comprando
    Dado que eu tenho um produto para consultar   produto.json
    Quando eu faço a consulta desse produto
    Inserir produto no carrinho
    E desejo continuar comprando
    Então devo inserir o produto no carrinho e retornar para lista de produtos

Adicionar um produto ao carrinho de compras
    Dado que eu tenho um produto para consultar   produto.json
    Quando eu faço a consulta desse produto
    Inserir produto no carrinho
    E desejo finalizar a compras
    Então devo ver dados da compra

Excluir um produto do carrinho
    Dado que eu tenho um produto no carrinho   produto.json
    Quando acesso o carrinho
    Desejo excluir o produto
    Então devo ver mensagem do carrinho vazio
*** Settings ***
Documentation       Consulta de produtos

Resource    ../resources/actions.robot

Suite Setup     Open Session
Suite Teardown  Close Session

Test Teardown   After Test

*** Test Cases ***
Consultar produto
    Dado que eu tenho um produto para consultar   produto.json
    Quando eu faço a consulta desse produto
    Então devo ver alguns itens na páginas

Consultar Produto inexistente
    Dado que eu tenho um produto para consultar   produtoinexistente.json
    Quando eu faço a consulta desse produto
    Então devo ver mensagem
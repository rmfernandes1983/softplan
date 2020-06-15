*** Settings ***
Documentation       Este arquivo implementa funções e elementos da página consulta produtos

*** Keywords ***
Consulta Produto
    [Arguments]     ${product_json}

    Input Text       id:search_query_top    ${product_json['name']}
    Click Element    class:btn

Retornar informações da consulta
    Wait Until Element Is Visible    xpath://*[@id='center_column']/h1/span[2]
    ${quantidade_itens}=             Get Text                                   xpath://*[@id='center_column']/h1/span[2]                            
    Log                              Total de resultado: ${quantidade_itens}
    Capture Page Screenshot
    Click Element                    id:list
    Sleep                            3
    Capture Page Screenshot 
    ${itens_total_pagina}=           Get Text                                   class:product-count
    Log                              Total de itens e quantidade página:${itens_total_pagina}
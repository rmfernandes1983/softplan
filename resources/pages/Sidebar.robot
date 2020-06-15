*** Settings ***
Documentation       Este arquivo implementa funções e elementos do Menu

*** Keywords ***
Validar Menu Woman
    Sleep   1
    Wait Until Element Is Visible       xpath://*[@class='sf-menu clearfix menu-content sf-js-enabled sf-arrows']/li
    Click Element                       xpath://*[@class='sf-menu clearfix menu-content sf-js-enabled sf-arrows']/li
    Wait Until Element Is Visible       xpath://*[@class='tree dynamized']/li/span
    Click Element                       xpath://*[@class='tree dynamized']/li/span
    Wait Until Element Is Visible       xpath://*[@class='tree dynamized']/li[2]/span
    Click Element                       xpath://*[@class='tree dynamized']/li[2]/span
    ${Submenu_1}=           Get Text              xpath://*[@class='tree dynamized']/li/a  
    ${categoria_1}=           Get Text            xpath://*[@class='tree dynamized']/li/ul/li/a
    ${categoria_2}=           Get Text            xpath://*[@class='tree dynamized']/li/ul/li[2]/a
    Log             Submenu:"${Submenu_1}" com Categorias: "${categoria_1}" e "${categoria_2}"
    ${Submenu_1}=           Get Text              xpath://*[@class='tree dynamized']/li[2]/a 
    ${categoria_1}=           Get Text            xpath://*[@class='tree dynamized']/li[2]/ul/li/a
    ${categoria_2}=           Get Text            xpath://*[@class='tree dynamized']/li[2]/ul/li[2]/a
    ${categoria_3}=           Get Text            xpath://*[@class='tree dynamized']/li[2]/ul/li[3]/a    
    Log             Submenu:"${Submenu_1}" com Categorias: "${categoria_1}", "${categoria_2}" e "${categoria_3}" 

Validar Menu Dresses
    Sleep   2
    Wait Until Element Is Visible       xpath://*[@class='sf-menu clearfix menu-content sf-js-enabled sf-arrows']/li[2]
    Click Element                       xpath://*[@class='sf-menu clearfix menu-content sf-js-enabled sf-arrows']/li[2]
    Wait Until Element Is Visible       xpath://*[@id='categories_block_left']/h2
    ${Submenu_1}=             Get Text            xpath://*[@id='categories_block_left']/h2  
    ${categoria_1}=           Get Text            xpath://*[@id='categories_block_left']/div/ul/li
    ${categoria_2}=           Get Text            xpath://*[@id='categories_block_left']/div/ul/li[2]
    ${categoria_3}=           Get Text            xpath://*[@id='categories_block_left']/div/ul/li[3]
    Log             Submenu:"${Submenu_1}" com Categorias: "${categoria_1}", "${categoria_2}" e "${categoria_3}" 
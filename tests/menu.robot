*** Settings ***
Documentation       Menu...

Resource    ../resources/actions.robot

Suite Setup     Open Session
Suite Teardown  Close Session

Test Teardown   After Test

*** Test Cases ***
Acessar itens do Menu woman
    Dado que desejo verificar os itens do menu "woman"

Acessar itens do Menu dresses
    Dado que desejo verificar os itens do menu "dresses"
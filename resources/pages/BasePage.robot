*** Settings ***
Documentation       Este arquivo implementa abertura e fechamento do navegador

***Variables***
${base_url}     http://automationpractice.com/index.php


*** Keywords ***
### Hooks
Open Session
    Run Keyword if      "${browser}" == "chrome"
    ...     Open Chrome

    Run Keyword if      "${browser}" == "headless"
    ...     Open Chrome Headless

    Set Selenium Implicit Wait  5
#    Set Window Size     1280        800

Close Session
    Close Browser

After Test
    Capture Page Screenshot

# Product Form Session
#     Login Session
#     Go To Product Form
   
Open Chrome
    Open Browser    ${base_url}    chrome   options=add_experimental_option('excludeSwitches', ['enable-logging'])

Open Chrome Headless
    Open Browser    ${base_url}    headlesschrome     options=add_argument('--disable-dev-shm-usage')

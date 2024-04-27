*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${URL}            https://zitrus.com.br/
${BROWSER}        Chrome
${Button XPath}   //div[contains(@class, "elementor-42")]/header[1]/div[2]/div[2]/div/div[2]/div/div/a

*** Test Cases ***
Verify Homepage Load
    Open Browser    ${URL}    ${BROWSER}
    Title Should Be    Sistemas de Gestão de Planos de Saúde Unimed - Zitrus - Healthtech
    Close Browser
Click the button with specific XPath
    Open Browser    ${URL}    ${BROWSER}
    Click Element    xpath=${Button XPath}
    Close Browser
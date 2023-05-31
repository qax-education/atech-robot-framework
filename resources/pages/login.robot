*** Settings ***
Documentation            Página de login

Library    Browser

*** Keywords ***
Go to login page

    Go To        http://localhost:3000

    Wait For Elements State        h1          visible        5
    Get Text        css=h1        equal        Faça seu login


Submit login form
    [Arguments]        ${user}

    Fill Text        css=input[name=email]        ${user}[email]
    Fill Text        css=input[name=password]     ${user}[password]

    Click             css=button[type=submit] >> text=Entrar

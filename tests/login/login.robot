*** Settings ***
Documentation        Cenários de testes do login

Resource        ${EXECDIR}/resources/base.robot

Library       JSONLibrary

*** Test Cases ***
Deve poder logar com sucesso
    [Tags]     smoke

    ${user}    Create Dictionary
    ...        name=Steve Woz
    ...        email=woz@apple.com
    ...        password=pwd123

    Create new user    ${user}
    
    Start Session
    Go to login page
    Submit login form           ${user}
    User should be logged in    ${user}[name]

Não deve logar com senha incorreta

    ${user1}    Create Dictionary
    ...        name=Steve Rogers
    ...        email=steve@marvel.com
    ...        password=pwd123

    Create new user    ${user1}

    ${user2}    Create Dictionary
    ...        name=Steve Rogers
    ...        email=steve@marvel.com
    ...        password=abc123

    Start Session
    Go to login page
    Submit login form           ${user2}
    Notice should be            Ocorreu um erro ao fazer login, verifique suas credenciais.
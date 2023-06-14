*** Settings ***
Documentation        Cenários de testes do login

Resource        ../../resources/base.resource

Test Teardown        Finish Session
Library    Collections

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
    [Tags]    inv_pass

    ${user}    Create Dictionary
    ...        name=Steve Rogers
    ...        email=steve@marvel.com
    ...        password=pwd123

    Create new user    ${user}

    Start Session
    Go to login page
    
    Set To Dictionary       ${user}       password=123456

    Submit login form           ${user}
    Notice should be            Ocorreu um erro ao fazer login, verifique suas credenciais.
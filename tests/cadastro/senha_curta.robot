*** Settings ***
Documentation        Tentativa de cadastro com senha muito curta
Resource             ../../resources/base.resource
Test Template        Short password
Test Teardown        Finish Session

*** Test Cases ***
Não deve logar com 1 chars         a
Não deve logar com 2 chars         a2
Não deve logar com 3 chars         a23
Não deve logar com 4 chars         a23b
Não deve logar com 5 chars         a23b4
Não deve logar com 1 digito        1
Não deve logar com 2 digitos       12
Não deve logar com 3 digitos       123
Não deve logar com 4 digitos       1234
Não deve logar com 5 digitos       12345

*** Keywords ***
Short password
    [Arguments]        ${short_pass}
    
    &{user}         Create Dictionary
    ...    name=Steve Jobs
    ...    email=jobs@apple.com
    ...    password=${short_pass}

    Start Session
    Go to signup
    Register user        ${user}
    Alert should be      Informe uma senha com pelo menos 6 digitos
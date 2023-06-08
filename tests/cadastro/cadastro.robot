*** Settings ****

Resource    ../../resources/base.robot

Test Teardown        Finish Session

*** Test Cases ***
Deve cadastrar um novo usuário

    &{user}         Create Dictionary
    ...    name=Fernando Papito
    ...    email=fernando@hotmail.com
    ...    password=pwd123

    Remove User By Email            ${user}[email]

    Start Session
    Go to signup
    Register user        ${user}
    Notice should be     Boas vindas ao Mark85, o seu gerenciador de tarefas.

Usuário duplicado
    [Tags]    dup

    &{user}         Create Dictionary
    ...    name=Jean Gray
    ...    email=fenix@xmen.com
    ...    password=pwd123

    Create new user    ${user}

    Start Session
    Go to signup
    Register user        ${user}
    Notice should be     Oops! Já existe um cadastro com e-mail informado.

Nome deve ser obrigatório
    [Tags]    required
    
    &{user}         Create Dictionary
    ...    name=${EMPTY}
    ...    email=fenix@xmen.com
    ...    password=pwd123

    Start Session
    Go to signup
    Register user        ${user}
    Alert should be      Informe seu nome completo

Email deve ser obrigatório
    [Tags]    required

    &{user}         Create Dictionary
    ...    name=Steve Jobs
    ...    email=${EMPTY}
    ...    password=pwd123

    Start Session
    Go to signup
    Register user        ${user}
    Alert should be      Informe seu e-email

Senha deve ser obrigatória
    [Tags]    required

    &{user}         Create Dictionary
    ...    name=Steve Jobs
    ...    email=jobs@apple.com
    ...    password=${EMPTY}

    Start Session
    Go to signup
    Register user        ${user}
    Alert should be      Informe uma senha com pelo menos 6 digitos

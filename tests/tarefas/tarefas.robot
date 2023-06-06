*** Settings ***
Documentation        Testes de cadastro de tarefas

Resource       ${EXECDIR}/resources/base.robot

*** Test Cases ***
Deve poder cadastrar uma nova tarefa
    
    ${data}        Get fixture    tasks    create

    Create new user    ${data}[user]
    Login Session      ${data}[user]

    Go to task form
    Submit task form                 ${data}[task]
    Task should be registered        ${data}[task][name]

Deve remover uma tarefa indesejada
    [Tags]    remove

    ${data}        Get fixture    tasks     remove

    Create new user    ${data}[user]
    Login Session      ${data}[user]

    Go to task form
    Submit task form                 ${data}[task]
    Task should be registered        ${data}[task][name]
    
    Remove task              ${data}[task][name]
    Task should not exist    ${data}[task][name]

Deve poder marcar uma tarefa como concluída
    
    



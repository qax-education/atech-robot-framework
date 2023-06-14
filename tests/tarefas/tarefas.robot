*** Settings ***
Documentation        Testes de cadastro de tarefas

Resource       ../../resources/base.resource

Test Teardown        Finish Session
Library    Collections

*** Test Cases ***
Deve poder cadastrar uma nova tarefa
    [Tags]    smoke

    ${data}        Get fixture    tasks    create

    Create new user    ${data}[user]
    Login Session      ${data}[user]

    Purge amqp queue

    Go to task form
    Submit task form                 ${data}[task]
    Task should be registered        ${data}[task][name]

    ${result}        Get amqp message

    Log        ${result}[payload]

    Should Contain        ${result}[payload]        ${data}[user][email]
    Should Contain        ${result}[payload]        ${data}[task][name]

Não deve cadastrar tarefa com nome duplicado
    
    ${data}        Get fixture    tasks    duplicate

    Create new user        ${data}[user]
    
    POST user session      ${data}[user]
    POST new task          ${data}[task]

    Login Session      ${data}[user]

    Go to task form
    Submit task form    ${data}[task]
    Notice should be    Oops! Tarefa duplicada.


Deve remover uma tarefa indesejada
    [Tags]    remove

    ${data}        Get fixture    tasks     remove

    Create new user    ${data}[user]

    POST user session    ${data}[user]
    POST new task        ${data}[task]

    Login Session      ${data}[user]

    Remove task              ${data}[task][name]
    Task should not exist    ${data}[task][name]


Deve poder marcar uma tarefa como concluída
    [Tags]    done
    
    ${data}        Get fixture        tasks        done

    Create new user        ${data}[user]
    
    POST user session    ${data}[user]
    POST new task        ${data}[task]

    Login Session          ${data}[user]

    Task done                        ${data}[task][name]
    Task should be done              ${data}[task][name]


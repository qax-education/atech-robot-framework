*** Settings ***
Documentation            Camada que consome a API da aplicação

Library        RequestsLibrary

*** Keywords ***
POST user session
    [Arguments]        ${user}

    ${payload}         Create Dictionary
    ...                email=${user}[email]
    ...                password=${user}[password]

    ${response}        POST        http://localhost:3333/sessions
    ...         json=${payload}
    ...         expected_status=200
    
    ${token}        Set Variable        ${response.json()}[token]
    
    ${headers}        Create Dictionary
    ...               Authorization=${token}
    
    Set Test Variable    ${headers}


POST new task
    [Arguments]        ${payload}

    POST        http://localhost:3333/tasks
    ...         json=${payload}
    ...         headers=${headers}
    ...         expected_status=201
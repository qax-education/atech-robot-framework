*** Settings ***
Documentation            Camada que consome a API da aplicação

Resource       env.resource

Library        RequestsLibrary

*** Keywords ***
POST user session
    [Arguments]        ${user}

    ${payload}         Create Dictionary
    ...                email=${user}[email]
    ...                password=${user}[password]

    ${response}        POST        ${BASE_API}/sessions
    ...         json=${payload}
    ...         expected_status=200
    
    ${token}        Set Variable        ${response.json()}[token]
    
    ${headers}        Create Dictionary
    ...               Authorization=${token}
    
    Set Test Variable    ${headers}


POST new task
    [Arguments]        ${payload}

    POST        ${BASE_API}/tasks
    ...         json=${payload}
    ...         headers=${headers}
    ...         expected_status=201
*** Settings ***
Documentation        Helpers

Library      libs/mongo.py
Library      JSONLibrary

*** Keywords ***
Create new user
    [Arguments]        ${user}

    Remove User By Email        ${user}[email]
    Insert User                 ${user}

Get fixture
    [Arguments]        ${filename}        ${scenario}

    ${data}        Load Json From File
    ...    ${EXECDIR}/resources/fixtures/${filename}.json
    ...    encoding=utf-8

    [return]    ${data}[${scenario}]
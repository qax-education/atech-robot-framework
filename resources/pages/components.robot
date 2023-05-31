*** Settings ***
Documentation        Componentes em comum nas páginas

Library        Browser


*** Keywords ***
Notice should be
    [Arguments]     ${message}

    ${notice}       Set Variable        css=.notice p

    Wait For Elements State        ${notice}    visible    5
    Get Text        ${notice}        equal      ${message}  
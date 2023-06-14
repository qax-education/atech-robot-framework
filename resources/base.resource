*** Settings ***
Documentation        Tudo começa aqui

Library            Browser
Library            libs/mongo.py

Resource           env.resource
Resource           helpers.resource
Resource           services.resource
Resource           amqp.resource

Resource           pages/components/nav.resource
Resource           pages/components/notice.resource

Resource           pages/signup.resource
Resource           pages/login.resource
Resource           pages/tasks.resource

*** Keywords ***
Start Session
    New Browser        browser=chromium    headless=False
    New Page           ${BASE_URL}

Finish Session
    Take Screenshot

Login Session
    [Arguments]        ${user}

    Start Session
    Go to login page
    Submit login form           ${user}
    User should be logged in    ${user}[name]
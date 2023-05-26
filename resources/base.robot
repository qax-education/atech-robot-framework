*** Settings ***
Documentation        Tudo começa aqui

Library            Browser
Library            libs/mongo.py

Resource           pages/signup.robot

*** Keywords ***
Start Session
    New Browser        browser=chromium    headless=False
    New Page           http://localhost:3000
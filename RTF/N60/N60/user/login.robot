*** Settings ***
Resource          login-info.robot
Library           requests
Library           RequestsLibrary
Library           json
Library           Selenium2Library
Library           jsonpointer
Library           HttpLibrary

*** Test Cases ***
login-success
    ${headers}    create dictionary    Content-Type=application/json;charset=UTF-8    Accept=application/json, text/plain, */*
    log    测试设备地址为:
    log    ${url}
    create session    login    ${url}    ${headers}    #URL地址
    ${data}    create dictionary    username=${username}    password=${password}
    log    ${url}/api/systemctrl/users/login
    ${res}    POST On Session    login    /api/systemctrl/users/login    ${data}
    should be equal as strings    ${res.status_code}    200
    log    ${res.content}

test
    ${headers}    create dictionary    Content-Type=application/json;charset=UTF-8    Accept=application/json, text/plain, */*    App={"user":"admin","title":"","token":"18532c790a58dcc31b0d473b3a791770","alias":"Admin","changed":true,"language":"en"}
    log    测试设备地址为:
    log    ${url}
    create session    login    ${url}    ${headers}    #URL地址
    ${data}    set variable    {\n\n \ "username": "admin",\n\n \ "password": "Admin123"\n\n}
    log    ${url}/api/systemctrl/users/login
    ${res}    POST On Session    ${url}/api/systemctrl/users/login    ${data}
    should be equal as strings    ${res.status_code}    200
    log    ${res.content}

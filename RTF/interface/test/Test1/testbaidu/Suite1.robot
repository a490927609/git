*** Settings ***
Library           SeleniumLibrary
Library           RequestsLibrary
Library           requests
Library           json

*** Variables ***
${URL}            http://www.baidu.com









*** Test Cases ***
baiduApi
    ${time}=    get time
    log    ${time}
    ${headers}    create dictionary    Content-Type=text/plain; charset=UTF-8
    log    请求头：${headers}
    ${resp}=    requests.get    ${URL}/sugrec
    log    响应头内容：${resp.headers}
    log    响应体编码方式：${resp.encoding}
    log    文档编码方式(从HTML文档中找)：${resp.apparent_encoding}
    log    响应的状态码：${resp.status_code}
    log    获取返回的cookie信息：${resp.cookies.get_dict()}
    log    返回正文：${resp.content}
    log    将返回结果转化为json格式：${resp.json()}
    log    重定向历史，即前一次请求地址：${resp.history}
    ${res}    set variable    ${resp.content}
    log    ${res}
    ${data}=    Evaluate    json.loads($res)    json
    log    ${data['queryid']}

baidu
    log    ${url}
    Open Browser    ${url}    Chrome

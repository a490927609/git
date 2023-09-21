*** Settings ***
Documentation     全局变量host
Resource          login-info.robot
Library           requests
Library           RequestsLibrary
Library           json
Library           Selenium2Library
Library           jsonpointer
Library           HttpLibrary
Library           HttpLibrary.HTTP
Library           Collections

*** Variables ***
@{host}           192.168.43.32

*** Test Cases ***
login-success2
    ${headers}    create dictionary    Content-Type=application/json;charset=UTF-8    Accept=application/json, text/plain, */*    App=${app}
    log    测试设备地址为:
    log    ${url}
    create session    login    ${url}    ${headers}    #URL地址
    Comment    ${data}    Evaluate    { \ \ "username": "admin", \ \ "password": "Admin123" }
    Comment    ${data}    set variable    { \ \ "username": "admin", \ \ "password": "Admin123" }
    ${data}    set variable    { \ \ "username": "admin", \ \ "password": "Admin123" }
    Comment    ${data1}    ${resp.json()}    ${data}
    Comment    log    ${url}/api/systemctrl/users/login    }
    log    ${url}/api/systemctrl/users/login
    ${res}    POST On Session    login    /api/systemctrl/users/login    ${data}
    should be equal as strings    ${res.status_code}    200
    log    ${res.content}
    should be equal as strings    ${res.content}    {"result":"ok","data":{"token":"18532c790a58dcc31b0d473b3a791770","alias":"Admin","changed":true},"msg":null}

login-success
    #http头信息：
    ${headers}    create dictionary    Content-Type=application/json;charset=UTF-8    Accept=application/json, text/plain, */*    App=${app}
    #定义data变量
    ${data}    set variable    { \ \ "username": "admin", \ \ "password": "Admin123" }
    #创建session会话
    create session    login    ${url}    ${headers}    #URL地址
    #创建字典保存账号/密码
    ${param}    create dictionary    username=${username}    password=${password}
    log    创建字典保存账号/密码:${param}
    #将字典转为Json
    ${paramJson}    json.dumps    ${param}
    log    将字典转为Json:${paramJson}
    #将Json转为字典
    ${paramDict}    json.loads    ${paramJson}
    log    将Json转为字典:${paramJson}
    #将Json数据抛给URL并请求结果
    ${res}    POST On Session    login    /api/systemctrl/users/login    ${paramJson}
    log    返回码：${res.status_code}
    #匹配返回的code值是否200
    should be equal as strings    ${res.status_code}    200
    #使用Get Json Value解析Json（来自HttpLibrary.HTTP库）进行解析    #第一种取值方式，在Json中取
    log    返回内容：${res.content}
    ${res1_result}    Get Json Value    ${res.content}    /result    #获取返回值中result参数的value
    ${res1_token}    Get Json Value    ${res.content}    /data/token    #获取返回值中data参数下token的value
    log    ${res1_result}
    log    ${res1_token}
    #过滤双引号
    ${res1_result}    Evaluate    ${res1_result.strip()}
    log    ${res1_result}
    #匹配返回的值是否是ok
    should be equal as strings    ${res1_result}    ok
    #将返回Json转为字典对象    #第二种取值方式，在字典中取
    ${dict_content}    to json    ${res.content}
    log    ${dict_content}
    #使用Get From Dictionary获取字典对象中的值（来自Collections库）
    ${res2_result}    Get From Dictionary    ${dict_content}    result    #获取返回值中result参数的value
    ${res2_token}    Get From Dictionary    ${dict_content}[data]    token    #获取返回值中data参数下token的value
    log    ${res2_result}
    #打印全局变量
    log    主机名(全局变量)：${host}
    ${atrri}    json.loads    ${dict_content}    $[*].token
    log    ${atrri}

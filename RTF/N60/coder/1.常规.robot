*** Settings ***
Library           ../../Python37/Lib/site-packages/MyTest.py
Library           ../../Python37/Lib/site-packages/RequestsLibrary/
Library           ../../Python37/Lib/site-packages/DatabaseLibrary/
Library           ../../Python37/Lib/site-packages/Selenium2Library/
Library           HttpLibrary.HTTP
Library           ../../Python37/Lib/site-packages/HttpLibrary/
Resource          url.txt

*** Test Cases ***
1.新增/删除用户
    ${headers}    create dictionary    Content-Type=application/x-www-form-urlencoded    Authorization=Basic YWRtaW46YWRtaW4=
    log    测试设备地址为：
    log    ${url}
    log    新增用户----------------------------------------
    ${serialNumber}    get time    epoch    #生成随机数
    log    用户名
    ${user}    set variable    user${serialNumber}
    log    密码
    ${password}    set variable    12345678
    ${body}    create dictionary    Username=${user}    Password=${password}
    log    打印body值：${body}
    ${rep}    My Post    ${url}/api/v1/addUser.lua    ${body}    ${headers}
    log    获取返回值result:
    ${result}    get_json_value    ${rep}    /Result
    log    获取返回值status:
    ${status}    get json value    ${rep}    /Status
    Run Keyword If    ${result}==200 and ${status}=="OK"    log    用例执行成功，新增用户成功，返回信息${rep}
    Run Keyword If    ${status}!="OK" or ${result}!=200    fail    用例执行失败，新增用户失败，打印失败信息${rep}
    sleep    3
    log    删除用户--------------------------------------------
    ${body1}    create dictionary    Username=${user}
    log    打印body值：${body1}
    ${rep1}    My Post    ${url}/api/v1/removeUser.lua    ${body1}    ${headers}
    log    获取返回值result:
    ${result1}    get_json_value    ${rep1}    /Result
    log    获取返回值status:
    ${status1}    get json value    ${rep1}    /Status
    Run Keyword If    ${result1}==200 and ${status1}=="OK"    log    用例执行成功，删除用户成功，返回信息${rep}
    Run Keyword If    ${status1}!="OK" or ${result1}!=200    fail    用例执行失败，删除用户失败，打印失败信息${rep}

2.新增已存在的用户
    ${headers}    create dictionary    Content-Type=application/x-www-form-urlencoded    Authorization=Basic YWRtaW46YWRtaW4=
    log    测试设备地址为：
    log    ${url}
    log    新增用户----------------------------------------
    ${serialNumber}    get time    epoch    #生成随机数
    log    用户名
    ${user}    set variable    user${serialNumber}
    log    密码
    ${password}    set variable    12345678
    ${body}    create dictionary    Username=${user}    Password=${password}
    log    打印body值：${body}
    ${rep}    My Post    ${url}/api/v1/addUser.lua    ${body}    ${headers}
    log    获取返回值result:
    ${result}    get_json_value    ${rep}    /Result
    log    获取返回值status:
    ${status}    get json value    ${rep}    /Status
    Run Keyword If    ${result}==200 and ${status}=="OK"    log    用例执行成功，新增用户成功，返回信息${rep}
    Run Keyword If    ${status}!="OK" or ${result}!=200    fail    用例执行失败，新增用户失败，打印失败信息${rep}
    log    再次新增该用户${user}----------------------------------------
    sleep    3
    ${rep1}    My Post    ${url}/api/v1/addUser.lua    ${body}    ${headers}
    log    获取返回值result:
    ${result1}    get_json_value    ${rep1}    /Result
    log    获取返回值Reason:
    ${Reason}    get json value    ${rep1}    /Data/Reason
    Run Keyword If    ${result1}==405 and ${Reason}=="exist"    log    用例执行成功，重复新增失败，返回信息${rep1}
    Run Keyword If    ${Reason}!="exist" or ${result1}!=405    fail    用例执行失败，重复新增成功，打印失败信息${rep1}
    sleep    3
    log    删除用户--------------------------------------------
    ${body1}    create dictionary    Username=${user}
    log    打印body值：${body1}
    ${rep2}    My Post    ${url}/api/v1/removeUser.lua    ${body1}    ${headers}
    log    获取返回值result:
    ${result2}    get_json_value    ${rep2}    /Result
    log    获取返回值status:
    ${status2}    get json value    ${rep2}    /Status
    Run Keyword If    ${result2}==200 and ${status2}=="OK"    log    用例执行成功，删除用户成功，返回信息${rep}
    Run Keyword If    ${status2}!="OK" or ${result2}!=200    fail    用例执行失败，删除用户失败，打印失败信息${rep}

3.获取用户列表
    ${headers}    create dictionary    Content-Type=application/x-www-form-urlencoded    Authorization=Basic YWRtaW46YWRtaW4=
    log    测试设备地址为：
    log    ${url}
    log    获取用户列表---------------------------------------------------
    ${rep}    My Get    ${url}/api/v1/listUsers.lua    ${headers}
    log    获取返回值result:
    ${result}    get_json_value    ${rep}    /Result
    log    获取返回值status:
    ${status}    get json value    ${rep}    /Status
    Run Keyword If    ${result}==200 and ${status}=="OK"    log    用例执行成功，返回信息${rep}
    Run Keyword If    ${status}!="OK" or ${result}!=200    fail    用例执行失败，打印失败信息${rep}

4.修改HTTP用户登录密码
    ${headers}    create dictionary    Content-Type=application/x-www-form-urlencoded    Authorization=Basic YWRtaW46YWRtaW4=
    log    测试设备地址为：
    log    ${url}
    log    修改admin用户密码----------------------------------------
    ${serialNumber}    get time    epoch    #生成随机数
    log    用户名
    ${user}    set variable    test    #该用户已手动添加
    log    新密码
    ${password}    set variable    a7d78d
    ${body}    create dictionary    Username=${user}    Password=${password}
    log    打印body值：${body}
    ${rep}    My Post    ${url}/api/v1/changeUser.lua    ${body}    ${headers}
    log    获取返回值result:
    ${result}    get_json_value    ${rep}    /Result
    log    获取返回值status:
    ${status}    get json value    ${rep}    /Status
    Run Keyword If    ${result}==200 and ${status}=="OK"    log    用例执行成功，admin用户密码修改成功，返回信息${rep}
    Run Keyword If    ${status}!="OK" or ${result}!=200    fail    用例执行失败，admin用户密码修改失败，打印失败信息${rep}

5.获取设备的基本信息
    ${headers}    create dictionary    Content-Type=application/x-www-form-urlencoded    Authorization=Basic YWRtaW46YWRtaW4=
    log    测试设备地址为：
    log    ${url}
    log    获取设备基本信息---------------------------------------------------
    ${rep}    My Get    ${url}/api/v1/deviceInfo.lua    ${headers}
    log    获取返回值result:
    ${result}    get_json_value    ${rep}    /Result
    log    获取返回值status:
    ${status}    get json value    ${rep}    /Status
    Run Keyword If    ${result}==200 and ${status}=="OK"    log    用例执行成功，返回信息${rep}
    Run Keyword If    ${status}!="OK" or ${result}!=200    fail    用例执行失败，打印失败信息${rep}

6.获取设备的名称配置
    ${headers}    create dictionary    Content-Type=application/x-www-form-urlencoded    Authorization=Basic YWRtaW46YWRtaW4=
    log    测试设备地址为：
    log    ${url}
    log    获取设备名称配置---------------------------------------------------
    ${rep}    My Get    ${url}/api/v1/getDeviceNames.lua    ${headers}
    log    获取返回值result:
    ${result}    get_json_value    ${rep}    /Result
    log    获取返回值status:
    ${status}    get json value    ${rep}    /Status
    Run Keyword If    ${result}==200 and ${status}=="OK"    log    用例执行成功，返回信息${rep}
    Run Keyword If    ${status}!="OK" or ${result}!=200    fail    用例执行失败，打印失败信息${rep}

7.获取Web(HTTP)服务端口
    ${headers}    create dictionary    Content-Type=application/x-www-form-urlencoded    Authorization=Basic YWRtaW46YWRtaW4=
    log    测试设备地址为：
    log    ${url}
    log    获取Web(HTTP)服务端口---------------------------------------------------
    ${rep}    My Get    ${url}/api/v1/getWebServicePort.lua    ${headers}
    log    获取返回值result:
    ${result}    get_json_value    ${rep}    /Result
    log    获取返回值status:
    ${status}    get json value    ${rep}    /Status
    Run Keyword If    ${result}==200 and ${status}=="OK"    log    用例执行成功，返回信息${rep}
    Run Keyword If    ${status}!="OK" or ${result}!=200    fail    用例执行失败，打印失败信息${rep}

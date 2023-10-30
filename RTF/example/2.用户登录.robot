*** Settings ***
Library           ../../python3.9.13/Lib/site-packages/RequestsLibrary/
Library           ../../python3.9.13/Lib/site-packages/DatabaseLibrary/
Library           ../../python3.9.13/Lib/site-packages/Selenium2Library/
Resource          url.txt
Library           ../../python3.9.13/Lib/site-packages/MyTest.py
Library           HttpLibrary.HTTP
Library           ../../python3.9.13/Lib/site-packages/HttpLibrary/
Library           String
Library           Collections
Library           Screenshot

*** Test Cases ***
1.1 用户正常登录
    ${headers}    create dictionary    Content-Type=application/x-www-form-urlencoded    Authorization=Basic YWRtaW46YWRtaW4=    content-type=application/json
    log    测试设备地址为：
    log    ${url}
    log    登录设备后台----------------------------------------
    Comment    ${body}=    Evaluate    { "user":"admin","password":"Admin123" }
    ${body}    create dictionary    user=admin    password=Admin123
    ${body1}    MyTest.To Json    ${body}    #转成json
    log    ${body1}
    ${rep}    My Post    ${url}/api/users/login.json    ${body1}    ${headers}
    Comment    log    获取返回值result:
    Comment    ${result}    get_json_value    ${rep}    /result
    Comment    Run Keyword If    ${result}=="ok"    log    用例执行成功，用户登录成功
    Comment    Run Keyword If    ${result}!="ok"    fail    用例执行失败，用户登录失败

2.2 接口测试常用关键字
    #打印
    Comment    log    Hello World
    #定义变量并赋值
    Comment    ${test}    Set Variable    test-6    #定义变量并赋值
    #获取当前时间
    Comment    ${time}    get time
    #获取随机时间戳
    Comment    ${epoch}    get time    epoch    #随机时间戳
    Comment    ${epoch3}    Set Variable    ${epoch}用户名
    #取随机数
    Comment    ${name}    Evaluate    random.randint(000000,999999)    random
    #生成电话号码
    Comment    ${cellphone}    Evaluate    random.choice(['139','188','185','136','158','151'])+"".join(random.choice("0123456789") for i in range(8))    random
    #四则运算
    Comment    ${var}    Set Variable    9
    Comment    ${var1}    Set Variable    3
    Comment    ${var2}    Evaluate    ${var}+${var1}
    #设置等待时间
    Comment    sleep    10
    #连接并查询数据库
    Comment    Connect To Database Using Custom Params    pymysql    database=库名, user=用户名, password=密码, host=IP, port=端口号
    Comment    ${result}    Query    数据库查询语句
    Comment    log    ${result[0][0]}
    Comment    ${result1}    Set Variable    ${result[0][0]}    #获取字符串
    Comment    Disconnect From Database    #断开数据库连接
    #创建字典
    Comment    ${body}    create dictionary    user=admin    password=Admin123
    Comment    ${body1}    MyTest.To json    ${body}    #转成json格式
    Comment    ${key}    Get dictionary Keys    ${body}    #获取键
    Comment    ${value}    Get dictionary Values    ${body}    #获取值
    #post/get请求
    Comment    ${rep}    My post    请求地址    data    headers
    #获取json返回值
    Comment    ${test}    Set Variable    {"id":1,"name":"test"}
    Comment    ${name}    get_json_value    ${test}    /name
    #将json字符串转换成字典对象
    Comment    ${test}    Set Variable    {"id":1,"name":"test"}
    Comment    ${name}    get_json_value    ${test}    /name
    Comment    ${name_parsejson}    parse json    ${name}    #先取值再单个转换
    Comment    ${name_tojson1}    RequestsLibrary.To json    ${test}    #整体转换再取值
    Comment    ${name1}    Get From Dictionary    ${name_tojson1}    name
    #if语句
    Comment    ${status}    Set Variable    200
    Comment    Run Keyword If    ${status}==200    log    success
    ...    ELSE    fail
    #for循环的使用
    Comment    FOR    ${var}    IN RANGE    3    #循环次数
        Comment    ${var1}    Set Variable    ${var}+1
    Comment    END
    Comment    FOR    ${var}    IN    a    b    c    #指定值循环
        Comment    log    ${var}
    Comment    END
    Comment    ${list}    Set Variable    d    e    f
    Comment    FOR    ${var}    IN    ${list}    \    #从列表取值循环
        Comment    log    ${var}
    Comment    END
    Comment    log    跳出循环
    Comment    FOR    ${var}    IN RANGE    50
        Comment    ${name}    Evaluate    random.randint(0,4)    random
        Comment    ${name1}    Evaluate    random.randint(0,4)    random
        Comment    Run Keyword If    '${name1}'=='${name}'    Exit For Loop    #根据条件跳出循环
        Comment    log    因name1:${name1}不等于name:${name}，因此继续循环
        Comment    sleep    2
    Comment    END
    #连接对象
    Comment    ${catenate}    Catenate    happy    working    445
    #获取字符长度
    Comment    ${name}    Set Variable    zhangsan    #定义变量并赋值
    Comment    ${len}    Get Length    ${name}
    #移除字符串特定字符
    Comment    ${var}    Set Variable    abcdefg
    Comment    ${var1}    Remove String    ${var}    cd

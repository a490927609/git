import requests
import json
import HttpLibrary
import jsonpointer
headers = {"nameSpace" : "lcw"}
headers_admin = {}


def My_Get(url, headers):
	resp = requests.get(url, headers=headers)
	return resp.content
	
def My_Post(url, data, headers):
	resp = requests.post(url, data=data, headers=headers)
	return resp.content
    
def My_Post_Null_Data(url, headers):
	resp = requests.post(url, data=None, headers=headers)
	return resp.content
	
def My_Post_Null_Header(url, data):
	resp = requests.post(url, data=data)
	return resp.content
	
def My_Post_Null_Data_Hearder(url):
	resp = requests.post(url, data=None)
	return resp.content
	
def My_Post_LocalFile(url, data, file, headers):
	files = {'file': open(path, 'rb')}
	resp = requests.post(url, data=data, files=files, headers=headers)
	return resp.content
	
def My_Delete(url):
	resp = requests.post(url, headers=headers)
	return resp.content
	
def My_Put(url, data):
	resp = requests.post(url, headers=headers)
	return resp.content
	
def My_Get_Admin(url):
	resp = requests.get(url, headers=headers_admin)
	return resp.content
	
def My_Put_Admin(url, data):
	files = {'file': open(path, 'rb')}
	resp = requests.post(url, files=files, headers=headers_admin)
	return resp.content
	
def My_Delete_Admin(url):
	resp = requests.post(url, headers=headers_admin)
	return resp.content
	
def To_Json(data):
	json_str = json.dumps(data)
	return json_str

def LoginTo(url2, loginName, headers2):
        url = 'http://10.0.40.121:8088/api/system/login/doLogin'
        headers = {
                'content-type': "multipart/form-data; boundary=----WebKitFormBoundary7MA4YWxkTrZu0gW",
                'cache-control': "no-cache"
                }
        payload = "------WebKitFormBoundary7MA4YWxkTrZu0gW\r\nContent-Disposition: form-data; name=\"loginName\"\r\n\r\n"+loginName+"\r\n------WebKitFormBoundary7MA4YWxkTrZu0gW\r\nContent-Disposition: form-data; name=\"password\"\r\n\r\n111111\r\n------WebKitFormBoundary7MA4YWxkTrZu0gW--"
        print(payload)
	#print resp.text
        s =requests.session()
        resp = s.post(url, data=payload, headers=headers)
        resp2 = s.post(url2, headers=headers2)
        return resp2.content

def LoginTo_Data(url2, loginName, data, headers2):
        url = 'http://10.0.40.121:8088/api/system/login/doLogin'
        headers = {
                'content-type': "multipart/form-data; boundary=----WebKitFormBoundary7MA4YWxkTrZu0gW",
                'cache-control': "no-cache"
                }
        payload = "------WebKitFormBoundary7MA4YWxkTrZu0gW\r\nContent-Disposition: form-data; name=\"loginName\"\r\n\r\n"+loginName+"\r\n------WebKitFormBoundary7MA4YWxkTrZu0gW\r\nContent-Disposition: form-data; name=\"password\"\r\n\r\n111111\r\n------WebKitFormBoundary7MA4YWxkTrZu0gW--"
        print(payload)
	#print resp.text
        s =requests.session()
        resp = s.post(url, data=payload, headers=headers)
        resp2 = s.post(url2, data=data, headers=headers2)
        return resp2.content

def ChangePass(url2, loginName, headers2):
        url = 'http://10.0.40.121:8088/api/system/login/doLogin'
        headers = {
                'content-type': "multipart/form-data; boundary=----WebKitFormBoundary7MA4YWxkTrZu0gW",
                'cache-control': "no-cache"
                }
        payload = "------WebKitFormBoundary7MA4YWxkTrZu0gW\r\nContent-Disposition: form-data; name=\"loginName\"\r\n\r\n"+loginName+"\r\n------WebKitFormBoundary7MA4YWxkTrZu0gW\r\nContent-Disposition: form-data; name=\"password\"\r\n\r\n123456\r\n------WebKitFormBoundary7MA4YWxkTrZu0gW--"
        print(payload)
	#print resp.text
        s =requests.session()
        resp = s.post(url, data=payload, headers=headers)
        resp2 = s.post(url2, headers=headers2)
        return resp2.content




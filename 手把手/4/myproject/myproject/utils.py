# json序列化时间对象
import json
import datetime
import sys

from django.db import models
import base64
from Crypto.Cipher import AES
import paramiko
from myproject.settings import BASE_DIR


class DateEncoder(json.JSONEncoder):
    def default(self, obj):
        if isinstance(obj, datetime.datetime):
            return obj.strftime('%Y-%m-%d %H:%M:%S')

        elif isinstance(obj, datetime.date):
            return obj.strftime("%Y-%m-%d")

        else:
            return json.JSONEncoder.default(self, obj)


class ModelsUtil(models.Model):
    def toJSON(self, obj):  # 转成json格式
        fields = []
        for field in self.id._meta.fields:
            fields.append(field.name)
        d = {}
        for attr in fields:
            d[attr] = getattr(obj, attr)
        import json
        return json.dumps(d, cls=DateEncoder)

    def toDict(self, obj):  # 转成dict格式
        fields = []
        for field in self.id._meta.fields:
            fields.append(field.name)
        d = {}
        for attr in fields:
            d[attr] = getattr(obj, attr)
        return d


# 补足字符串长度为16的倍数
def add_to_16(s):
    while len(s) % 16 != 0: #len()获取字符串长度
        s += '\0'
    return str.encode(s)  # 返回bytes


# 加密方法
def Encrypted_text(text):
    key = 'jiaparts20201225'
    aes = AES.new(str.encode(key), AES.MODE_ECB)  # 初始化加密器，本例采用ECB加密模式
    encrypted_text = str(base64.encodebytes(aes.encrypt(add_to_16(text))), encoding='utf8').replace('\n', '')  # 加密
    return encrypted_text


# 解密方法
def Decrypted_text(passwod_text):
    key = 'jiaparts20201225'
    aes = AES.new(str.encode(key), AES.MODE_ECB)  # 初始化加密器，本例采用ECB加密模式
    decrypted_text = str(
        aes.decrypt(base64.decodebytes(bytes(passwod_text, encoding='utf8'))).rstrip(b'\0').decode("utf8"))  # 解密
    return decrypted_text

def connectDB():
    # 堡垒机配置
    # 地址
    bl_hostname = "119.3.105.105"
    # 端口
    bl_port = 2022
    # 用户名
    bl_username = "testuser2"
    # 密钥文件路径
    bl_key_path = str(BASE_DIR) + "/templet/testuser2_id_rsa"

    private = paramiko.RSAKey.from_private_key_file(bl_key_path)
    # 业务机配置
    hostname = ""
    username = ""
    password = "jiaparts"
    passinfo = 'password: '
    paramiko_log = str(BASE_DIR) + "/log/syslogin.log"
    paramiko.util.log_to_file(paramiko_log)

    # 密钥连接堡垒机
    client = paramiko.SSHClient()
    client.set_missing_host_key_policy(paramiko.AutoAddPolicy())
    client.connect(hostname=bl_hostname, port=bl_port, username=bl_username, pkey=private)

    # new session
    channel = client.invoke_shell()
    channel.settimeout(20)
    buff = ''
    channel.sendall('tos 1 ' + '\n')
    while not buff.endswith(passinfo):  # 是否以字符串 'password 结尾
        try:
            resp = channel.recv(9999)  #
        except Exception as e:
            print('Error info:%s 连接超时.' % (str(e)))
            channel.close()
            client.close()
            sys.exit()
        buff += resp.decode()  # 获取的resp是bytes类型，测试的时候一直报错，最后才发现这个原因
        if not buff.find('yes/no') == -1:  # 模拟登陆是输入yes
            channel.sendall('yes\n')
            buff = ''
    channel.send(password + '\n')  # 发送密码
    buff = ''
    while not buff.endswith('# '):
        resp = channel.recv(9999)
        if not resp.decode().find(passinfo) == -1:
            print('Error info: 认证失败.')
            channel.close()
            client.close()
            sys.exit()
        buff += resp.decode()
    return channel,client

def connectLog():
    # 堡垒机配置
    # 地址
    bl_hostname = "119.3.105.105"
    # 端口
    bl_port = 2022
    # 用户名
    bl_username = "testuser2"
    # 密钥文件路径
    bl_key_path = str(BASE_DIR) + "/templet/testuser2_id_rsa"

    private = paramiko.RSAKey.from_private_key_file(bl_key_path)
    # 业务机配置
    hostname = ""
    username = ""
    password = "jiaparts"
    passinfo = 'password: '
    paramiko_log = str(BASE_DIR) + "/log/syslogin.log"
    paramiko.util.log_to_file(paramiko_log)

    # 密钥连接堡垒机
    client = paramiko.SSHClient()
    client.set_missing_host_key_policy(paramiko.AutoAddPolicy())
    client.connect(hostname=bl_hostname, port=bl_port, username=bl_username, pkey=private)

    # new session
    channel = client.invoke_shell()
    channel.settimeout(20)
    buff = ''
    channel.sendall('tos 2 ' + '\n')
    while not buff.endswith(passinfo):  # 是否以字符串 'password 结尾
        try:
            resp = channel.recv(9999)  #
        except Exception as e:
            print('Error info:%s 连接超时.' % (str(e)))
            channel.close()
            client.close()
            sys.exit()
        buff += resp.decode()  # 获取的resp是bytes类型，测试的时候一直报错，最后才发现这个原因
        if not buff.find('yes/no') == -1:  # 模拟登陆是输入yes
            channel.sendall('yes\n')
            buff = ''
    channel.send(password + '\n')  # 发送密码
    buff = ''
    while not buff.endswith('# '):
        resp = channel.recv(9999)
        if not resp.decode().find(passinfo) == -1:
            print('Error info: 认证失败.')
            channel.close()
            client.close()
            sys.exit()
        buff += resp.decode()
    return channel,client
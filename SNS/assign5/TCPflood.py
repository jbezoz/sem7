import socket 

target_ip ='127.0.0.1'
target_port= 1818

while True:
    client = socket.socket(socket.AF_INET,socket.SOCK_STREAM)  #sockstream is tcp protocol, afinet is a new socket object
    client.connect_ex((target_ip,target_port))
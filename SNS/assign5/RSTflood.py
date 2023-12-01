import socket 
import time

target_ip ='127.0.0.1'
target_port= 1818

while True:
    client = socket.socket(socket.AF_INET,socket.SOCK_STREAM)  #sockstream is tcp protocol, afinet is a new socket object
    client.setblocking(0) #will not block the execution of the program. send request
    client.connect_ex((target_ip,target_port))
    client.close()
   


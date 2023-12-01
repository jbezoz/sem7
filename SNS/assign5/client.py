import socket
import time

# Define the server's IP address and port
server_ip = '127.0.0.1'  # Replace with the actual server IP
server_port = 1818  # Replace with the actual server port

while True:
    start_time = time.time()
    client_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    client_socket.connect((server_ip, server_port)) 
    # recive message to the server
    message= client_socket.recv(1024).decode()
    endtime= time.time()
    print(message,endtime-start_time)
    time.sleep(1)

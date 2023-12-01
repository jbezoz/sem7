import socket
import time

# Defining host and port for your server
host = '0.0.0.0'  
port = 1818  

server_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)  
server_socket.bind((host, port))  
server_socket.listen(5)
print("listening now")

def handle_client(client_socket):
    Response = b"hello "
    # send data to the client
    client_socket.send(Response)  
    time.sleep(1)
    client_socket.close()

while True:
    try:
        client_socket,address =server_socket.accept()
        print("connection from ",address)
        handle_client(client_socket)
        print(f"connection from {address} is closed) ")
    except KeyboardInterrupt:
        break

print("server stopped")

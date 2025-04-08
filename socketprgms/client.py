import socket

client_socket=socket.socket(socket.AF_INET,socket.SOCK_STREAM)

client_socket.connect(('localhost',12345))

while True:
    message=input("you:")
    if message.lower()=='exit':
        break
    client_socket.sendall(message.encode())
    response=client_socket.recv(1024).decode()
    print(f"server response:{response}")

client_socket.close()
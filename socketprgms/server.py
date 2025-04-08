import socket

server_socket=socket.socket(socket.AF_INET,socket.SOCK_STREAM)

server_socket.bind(('localhost',12345))

server_socket.listen(1)
print("server is listening to port 12345")

conn,addr=server_socket.accept()
print(f"connected to {addr}")

while True:
    data=conn.recv(1024).decode()
    if not data:
        break
    print(f"client says: {data}")
    conn.sendall(f"server recieved:{data}".encode())


conn.close()
server_socket.close()
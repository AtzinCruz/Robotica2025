import requests

server_url = "http://172.24.14.84/data"  # Dirección del servidor

while True:
    message = input("Escribe un mensaje para el servidor (o 'exit' para salir): ")
    
    if message.lower() == "exit":
        print("Saliendo del cliente...")
        break

    data = {"message": message}  # Envía el input del usuario como JSON
    response = requests.post(server_url, json=data)

    server_response = response.json().get("response", "Sin respuesta")
    print("Respuesta del servidor:", server_response)

    



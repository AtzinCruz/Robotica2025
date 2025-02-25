from flask import Flask, request, jsonify

app = Flask(__name__)

@app.route('/data', methods=['POST'])
def receive_data():
    data = request.json  # Recibe JSON del cliente
    message = data.get("message", "")

    print("\nMensaje recibido del cliente:", message)
    
    # Pide una respuesta manualmente al usuario del servidor
    response_text = input("Ingresa tu respuesta para el cliente: ")

    return jsonify({"response": response_text})  # Envía la respuesta al cliente

if __name__ == '__main__':
    app.run(host="172.24.14.84", port=5000)  

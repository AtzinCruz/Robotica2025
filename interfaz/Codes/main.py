from PyQt5.QtWidgets import QApplication
from PyQt5.QtQml import QQmlApplicationEngine
from PyQt5.QtCore import QObject, pyqtSignal, pyqtSlot
import sys
import threading
import time
import requests
import json

server_url = "http://192.168.0.254:5000/data"  # Dirección del servidor
extracted_data = []


def receive_data():
    while True:
        message = input("Escribe un mensaje para el servidor (o 'exit' para salir): ")
        if message.lower() == "exit":
            break
    
        payload = {"message": message}
        
        try:
            response = requests.post(server_url, json=payload)
            response.raise_for_status()  # Lanza un error si el request falla
            
            try:
                data = response.json()  # Intenta convertir la respuesta a JSON
                print("Respuesta del servidor:", data)
            except requests.exceptions.JSONDecodeError:
                print("Error: El servidor no devolvió una respuesta JSON válida.")
                print("Respuesta en texto:", response.text)
        
        except requests.exceptions.RequestException as e:
            print("Error de conexión con elservidor:",e)
                  
        data = dict(data)
        print(data["voltage"])
        print(data["amperage"])
        print(data["temperature"])
        print("Data Actualized Succesfully")

        threading.Timer(5, receive_data).start()

def execute_interface():
    app = QApplication(sys.argv)
    engine = QQmlApplicationEngine()
    engine.load("/home/bruno_rb/interfaz/Codes/Interfaz.qml")
    if not engine.rootObjects():
        print("Error: No root objects loaded.")
        sys.exit(-1)
    
    app_exec = app.exec_()
    
    sys.exit(app_exec)


class data_extraction:
 """
    def getVoltage():
    global extracted_data[0] = data.get("voltage")
        voltage_actualization = threading.Thread(3, getVoltage).start()"""


def main():
    receive_data()


    while True: 
        time.sleep(1)

    


if __name__ == "__main__":
    main()


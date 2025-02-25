import os
import sys
import threading
from PyQt5.QtWidgets import QApplication
from PyQt5.QtQml import QQmlApplicationEngine
from PyQt5.QtCore import QObject, pyqtSignal, pyqtSlot
from datetime import datetime
from reportlab.lib.pagesizes import letter
from reportlab.pdfgen import canvas
from io import StringIO
from formatos.srv import Moverob
import rclpy
from rclpy.node import Node
from gtts import gTTS
import speech_recognition as sr

class SetInterfaz(Node):
    def __init__(self):
        super().__init__('set_interfaz_client')
        self.cli = self.create_client(Moverob, 'move_robot')
        while not self.cli.wait_for_service(timeout_sec=1.0):
            self.get_logger().info('Service not available, waiting again...')
        self.req = Moverob.Request()

    def send_request(self, a, b):
        self.req.d1 = a
        self.req.d2 = b
        self.req.flipper = 0
        return self.cli.call_async(self.req)

class Backend(QObject):
    @pyqtSlot()
    def assistant(self):
        start_voice_assistant()

    @pyqtSlot()
    def switchOn(self):
        print("Robot on")
        interfaz_client_ = SetInterfaz()
        res = interfaz_client_.send_request(1, 0)
        rclpy.spin_until_future_complete(interfaz_client_, res)
        response = res.result()
        interfaz_client_.get_logger().info('SUCCESS: %d' % (response.success))
        interfaz_client_.destroy_node()

    @pyqtSlot()
    def moveFront1(self):
        print("Moving Forward")
        speak("Moving Forward")

    @pyqtSlot()
    def moveBack1(self):
        print("Going Back")

    @pyqtSlot()
    def moveRight(self):
        print("Right")
    
    @pyqtSlot()
    def moveLeft(self):
        print("Left")
    
    @pyqtSlot(int, int, int)
    def getSlidersValues(self, value1, value2, value3):
        print(f"X Value: {value1}")
        print(f"Y Value: {value2}")
        print(f"Z Value: {value3}")
        speak("Am position updated")

def create_pdf(log_path, terminal_output):
    c = canvas.Canvas(log_path, pagesize=letter)
    width, height = letter
    c.setFont("Helvetica", 12)
    c.drawString(100, height - 100, "Mission Log")
    c.drawString(100, height - 120, f"Date: {datetime.now()}")
    y_position = height - 140
    for line in terminal_output.getvalue().splitlines():
        c.drawString(100, y_position, line)
        y_position -= 20
        if y_position < 50:
            c.showPage()
            y_position = height - 50
    c.save()

class TerminalToPDF:
    def __init__(self, terminal_output, original_stdout):
        self.terminal_output = terminal_output
        self.original_stdout = original_stdout

    def write(self, message):
        self.terminal_output.write(message)
        self.original_stdout.write(message)

    def flush(self):
        pass

def speak(text):
    """Function to convert text to speech using gTTS"""
    tts = gTTS(text=text, lang="es")  # Puedes cambiar "en" a "es" para español
    temp_audio = "response.mp3"
    tts.save(temp_audio)

    # Reproducir audio según el sistema operativo
    if sys.platform.startswith("linux"):
        os.system("mpg321 response.mp3")
    elif sys.platform.startswith("win"):
        os.system("start response.mp3")
    elif sys.platform.startswith("darwin"):  # macOS
        os.system("afplay response.mp3")

def start_voice_assistant():
    responses = {
        "hola": "Que tranza mi valedor no sea putito y pongase a chambear",
        "como estas": "Todo bien mi rey",
        "como te llamas": "Soy Robi el asistene de voz de robotica.",
        "goodbye": "Hasta las vista baby",
        "pene" : "Comes",
        "quien es el mas femboy de robotica": "Ricardo Castillo Mayo",
        "worst boss": "Fernanda sarahi mancilla",

    }

    def listen():
        recognizer = sr.Recognizer()
        with sr.Microphone() as source:
            print("Listening...")
            recognizer.adjust_for_ambient_noise(source, duration=1)
            try:
                audio = recognizer.listen(source, timeout=10, phrase_time_limit=15)
                command = recognizer.recognize_google(audio).lower()
                print(f"You said: {command}")
                return command
            except sr.UnknownValueError:
                print("al chile no te entendi carnal.")
                return ""
            except sr.RequestError:
                print("Could not request results.")
                return ""

    speak("Hola Soy Robi que vergas quieres?")
    command = listen()
    if command in responses:
        speak(responses[command])
    else:
        speak("al chile no te entendi carnal.")

def main():
    app = QApplication(sys.argv)
    rclpy.init()
    engine = QQmlApplicationEngine()
    engine.load("/home/bruno_rb/ixnaminki_olinki_ws/src/interfaz/interfaz/Content/Home.qml")
    if not engine.rootObjects():
        print("Error: No root objects loaded.")
        sys.exit(-1)
    ruta_carpeta = "/home/bruno_rb/ixnaminki_olinki_ws/src/interfaz/interfaz/register"
    os.makedirs(ruta_carpeta, exist_ok=True)
    terminal_output = StringIO()
    original_stdout = sys.stdout
    sys.stdout = TerminalToPDF(terminal_output, original_stdout)
    backend = Backend()
    engine.rootContext().setContextProperty("pyInterface", backend)
    app_exec = app.exec_()
    sys.stdout = original_stdout
    fecha_hora_actual = datetime.now().strftime("%Y-%m-%d_%H-%M-%S")
    nombre_archivo = f"bitacora_{fecha_hora_actual}.pdf"
    ruta_log = os.path.join(ruta_carpeta, nombre_archivo)
    try:
        create_pdf(ruta_log, terminal_output)
        print(f"PDF saved at {ruta_log}")
    except Exception as e:
        print(f"Error saving PDF: {e}")
    terminal_output.close()
    sys.exit(app_exec)

if __name__ == "__main__":
    main()

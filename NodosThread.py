import sys
import rospy
import threading
from PyQt5.QtWidgets import QApplication
from PyQt5.QtCore import QObject, pyqtSignal
from PyQt5.QtQml import QQmlApplicationEngine
from std_msgs.msg import String

## pyqtSlot() para interfaz to ROS para bidireccional

class RosNode(QObject):
    ros_signal = pyqtSignal(str)  # Señal para enviar datos a la interfaz

    def __init__(self):
        super().__init__()
        rospy.init_node('ros_qml_node', anonymous=True)
        self.subscriber = rospy.Subscriber('/chatter', String, self.callback)
        self.publisher = rospy.Publisher('/chatter', String, queue_size=10)

    def callback(self, msg):
        self.ros_signal.emit(msg.data)  # Enviar datos a la GUI

    def start_ros(self):
        rospy.spin()  # Mantiene el nodo en ejecución

def run_ros():
    node = RosNode()
    node.start_ros()

if __name__ == "__main__":
    # Iniciar el nodo de ROS en un hilo separado
    ros_thread = threading.Thread(target=run_ros)
    ros_thread.daemon = True
    ros_thread.start()

    # Iniciar la aplicación Qt y cargar la interfaz QML
    app = QApplication(sys.argv)
    engine = QQmlApplicationEngine()
    engine.load("Interfaz.qml")

    if not engine.rootObjects():
        sys.exit(-1)

    sys.exit(app.exec_())

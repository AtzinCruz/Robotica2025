#!/usr/bin/env python3
import rospy
from sensor_msgs.msg import Joy  # Importar el mensaje Joy
from std_msgs.msg import Float32
from control import ControlNode  # Importar la clase ControlNode

'''
Ejecutar control
Receiver sensor
'''

class Computer:
    def __init__(self):
        self.sensor_data = None
        self.control_data = None

    def control_callback(self, msg):
        self.control_data = msg
        rospy.loginfo(f"Control data received: {msg}")

    def sensor_callback(self, msg):
        self.sensor_data = msg
        rospy.loginfo(f"Sensor data received: {msg}")

def main():
    # Inicializar el nodo ROS
    rospy.init_node('control_receiver', anonymous=True)

    computer = Computer()
    control_node = ControlNode()  # Instanciar ControlNode

    # Suscribirse al tópico 'control_state'
    rospy.Subscriber('control_state', Joy, computer.control_callback)

    # Suscribirse al tópico del sensor (ejemplo)
    rospy.Subscriber('sensor_topic', Float32, computer.sensor_callback)

    # Ejecutar el nodo de control en un hilo separado
    import threading
    control_thread = threading.Thread(target=control_node.run)
    control_thread.start()

    # Mantener el nodo en ejecución
    rospy.spin()

if __name__ == "__main__":
    main()
#!/usr/bin/env python3
import rospy
from test.msg import ControlState  # Reemplaza con el nombre de tu paquete

def callback(msg):
    """
    Función de callback que se ejecuta cada vez que se recibe un mensaje en el tópico.
    """
    print("\n--- Mensaje recibido ---")
    print(f"Ejes: {msg.axes}")
    print(f"Botones: {msg.buttons}")
    print(f"D-Pad: {msg.hat}")

def main():
    # Inicializar el nodo ROS
    rospy.init_node('control_receiver', anonymous=True)

    # Suscribirse al tópico 'control_state'
    rospy.Subscriber('control_state', ControlState, callback)

    # Mantener el nodo en ejecución
    rospy.spin()

if __name__ == "__main__":
    main()
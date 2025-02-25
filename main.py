#!/usr/bin/env python3
import rospy
from test.msg import ControlState  # Reemplaza con el nombre de tu paquete

# Variable de estado para Modo 1
modo1_activo = False

def modo1(msg):
    """
    Implementa las acciones del Modo 1 según la imagen del control.
    """
    global modo1_activo

    # Verifica si el botón "B" ha sido presionado (usualmente índice 1 en ROS)
    boton_b = msg.buttons[1]  # Ajusta el índice según tu configuración

    if boton_b:  # Si se presiona, cambiar estado
        modo1_activo = not modo1_activo
        rospy.loginfo(f"Modo 1 {'Activado' if modo1_activo else 'Desactivado'}")

    if modo1_activo:
        # Implementación del control en Modo 1
        motor_izquierdo = msg.axes[1]  # Ajusta según el eje correcto
        motor_derecho = msg.axes[3]    # Ajusta según el eje correcto

        # Simulación de control de motores (puedes enviar estos valores a otro nodo)
        rospy.loginfo(f"Motor Izquierdo: {motor_izquierdo}, Motor Derecho: {motor_derecho}")

def callback(msg):
    """
    Función de callback que se ejecuta cada vez que se recibe un mensaje en el tópico.
    """
    print("\n--- Mensaje recibido ---")
    print(f"Ejes: {msg.axes}")
    print(f"Botones: {msg.buttons}")
    print(f"D-Pad: {msg.hat}")

    # Llamar a modo1 para manejar la lógica de activación/desactivación
    modo1(msg)

def main():
    # Inicializar el nodo ROS
    rospy.init_node('control_receiver', anonymous=True)

    # Suscribirse al tópico 'control_state'
    rospy.Subscriber('control_state', ControlState, callback)

    # Mantener el nodo en ejecución
    rospy.spin()

if __name__ == "__main__":
    main()

#!/usr/bin/env python3
import rospy
from test.msg import ControlState  # Reemplaza con el nombre de tu paquete
import pygame

def main():
    # Inicializar pygame
    pygame.init()
    pygame.joystick.init()

    # Verificar si hay controladores conectados
    if pygame.joystick.get_count() == 0:
        rospy.logerr("No se encontró ningún controlador.")
        return

    # Obtener el primer controlador
    joystick = pygame.joystick.Joystick(0)
    joystick.init()

    rospy.loginfo(f"Controlador conectado: {joystick.get_name()}")

    # Inicializar el nodo ROS
    rospy.init_node('control', anonymous=True)
    pub = rospy.Publisher('control_state', ControlState, queue_size=10)
    rate = rospy.Rate(10)  # 10 Hz

    # Variables para almacenar el estado anterior
    prev_axes = []
    prev_buttons = []
    prev_hat = []

    try:
        while not rospy.is_shutdown():
            # Crear un mensaje ROS
            msg = ControlState()

            # Leer los ejes
            msg.axes = [round(joystick.get_axis(i)*10,3) for i in range(joystick.get_numaxes())]

            # Leer los botones
            msg.buttons = [joystick.get_button(i) for i in range(joystick.get_numbuttons())]

            # Leer el D-Pad (sombrero)
            if joystick.get_numhats() > 0:
                msg.hat = list(joystick.get_hat(0))
            else:
                msg.hat = [0, 0]

            # Publicar solo si hay cambios
            if msg.axes != prev_axes or msg.buttons != prev_buttons or msg.hat != prev_hat:
                pub.publish(msg)
                rospy.loginfo(f"Publicado: {msg}")

                # Actualizar el estado anterior
                prev_axes = msg.axes
                prev_buttons = msg.buttons
                prev_hat = msg.hat

            # Procesar eventos de pygame
            pygame.event.pump()
            rate.sleep()

    except rospy.ROSInterruptException:
        rospy.loginfo("Programa terminado.")
    finally:
        # Cerrar pygame
        pygame.quit()

if __name__ == "__main__":
    main()
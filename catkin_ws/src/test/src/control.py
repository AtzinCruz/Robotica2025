#!/usr/bin/env python3
import rospy
from sensor_msgs.msg import Joy  # Importar el mensaje Joy
import pygame

class ControlNode:
    def __init__(self):
        # Inicializar pygame
        pygame.init()
        pygame.joystick.init()

        # Verificar si hay controladores conectados
        if pygame.joystick.get_count() == 0:
            rospy.logerr("No se encontró ningún controlador.")
            return

        # Obtener el primer controlador
        self.joystick = pygame.joystick.Joystick(0)
        self.joystick.init()

        rospy.loginfo(f"Controlador conectado: {self.joystick.get_name()}")

        # Inicializar el nodo ROS
        rospy.init_node('control', anonymous=True)
        self.pub = rospy.Publisher('control_state', Joy, queue_size=10)
        self.rate = rospy.Rate(10)  # 10 Hz

        # Variables para almacenar el estado anterior
        self.prev_axes = []
        self.prev_buttons = []

    def run(self):
        try:
            while not rospy.is_shutdown():
                # Crear un mensaje ROS
                msg = Joy()

                # Leer los ejes
                msg.axes = [round(self.joystick.get_axis(i)*10,3) for i in range(self.joystick.get_numaxes())]

                # Leer los botones
                msg.buttons = [self.joystick.get_button(i) for i in range(self.joystick.get_numbuttons())]

                # Publicar solo si hay cambios
                if msg.axes != self.prev_axes or msg.buttons != self.prev_buttons:
                    self.pub.publish(msg)
                    rospy.loginfo(f"Publicado: {msg}")

                    # Actualizar el estado anterior
                    self.prev_axes = msg.axes
                    self.prev_buttons = msg.buttons

                # Procesar eventos de pygame
                pygame.event.pump()
                self.rate.sleep()

        except rospy.ROSInterruptException:
            rospy.loginfo("Programa terminado.")
        finally:
            # Cerrar pygame
            pygame.quit()

if __name__ == "__main__":
    node = ControlNode()
    node.run()
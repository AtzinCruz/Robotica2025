#!/usr/bin/env python3

import rospy
from std_msgs.msg import String

def talker():
    # Inicializa el nodo con nombre "talker"
    rospy.init_node('talker', anonymous=True)
    
    # Crea un Publisher que publicará en el topic '/chat' con tipo de mensaje String
    pub = rospy.Publisher('/chat', String, queue_size=10)

    rate = rospy.Rate(10)  # Frecuencia de 1 Hz (1 mensaje por segundo)
    
    while not rospy.is_shutdown():
        # Lee el mensaje del usuario
        msg = "Iniciado...."

        # Publica el mensaje
        rospy.loginfo(f"Mensaje enviado: {msg}")
        pub.publish(msg)

        rate.sleep()

if __name__ == '__main__':
    try:
        talker()
    except rospy.ROSInterruptException:
        pass

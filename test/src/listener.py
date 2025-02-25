#!/usr/bin/env python3

import rospy
from std_msgs.msg import String

def callback(data):
    # Esta función se llama cuando un mensaje es recibido en el topic
    rospy.loginfo(f"Listener: Recibido - {data.data}")

def listener():
    # Inicializa el nodo con nombre "listener"
    rospy.init_node('listener', anonymous=True)
    
    # Crea un Subscriber para escuchar el topic '/chat'
    rospy.Subscriber('/chat', String, callback)
    
    # Mantiene el nodo activo hasta que se detenga
    rospy.spin()

if __name__ == '__main__':
    try:
        listener()
    except rospy.ROSInterruptException:
        pass


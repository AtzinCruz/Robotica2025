#!/usr/bin/env python3
import rospy
from test.msg import ControlState  
from std_msgs.msg import Float32


motor_pins=[3,4] # Left Motor:4, Right Motor:3

current_correction = 40

motor_publishers = []
#create the publisher for every motor
for pin in motor_pins:
    publisher = rospy.Publisher(f'/motor_{pin}_control',Float32, queue_size=10)
    motor_publishers.append(publisher)

#Function that prints the actualized control values
def callback(msg):
    print(f"Axes: {msg.axes}") # 0: Left Sides, 1: Left U/D, 2: Left Trigger, 3: Right Sides, 4: Right U/D, 5 :Right Trigger
    print(f"Buttons: {msg.buttons}") # 0:A, 1:B, 2:X, 3:Y
                                     # 4:RB, 5:LB , 6: Cubos , 7: Lines, 8: Left J, 9: Right J
    print(f"D-Pad: {msg.hat}")# (0,1): Up, (1,0): Right, (0,-1): Down, (-1,0):Left


def motors_triggers(msg):
    print(f"Left Motor: {msg.axes[2]}")
    #send_motors(msg.axes[2],4)
    print(f"Right Motor: {msg.axes[5]}")
    #send_motors(msg.axes[5],3)

def motors_joysticks(msg):
    print(f"Left Motor: {msg.axes[1]}")
    #send_motors(msg.axes[1],4)
    print(f"Right Motor: {msg.axes[4]}")
    #send_motors(msg.axes[4],3)

def flippers_joystick(msg):
    print(f"Front Flipper: {msg.axes[1]}")
    #send_motors(msg.axes[1],4)
    print(f" Back Flipper: {msg.axes[4]}")
    #send_motors(msg.axes[4],3)

def dpad_motors(msg):
        if msg.hat == (0,1):
            print(f"Left Motor: 10")
            #send_motors(10,4)
            print(f"Right Motor: 10")
            #send_motors(10,3)
        elif msg.hat == (0,-1):
            print(f"Left Motor: -10")
            #send_motors(-1,4)
            print(f"Right Motor: {msg.axes[4]}")
            #send_motors(-10,3)



def main():
    # Inicializar el nodo ROS
    rospy.init_node('control_receiver', anonymous=True)

    # Suscribirse al tópico 'control_state'
    rospy.Subscriber('control_state', ControlState, callback)

    # Mantener el nodo en ejecución
    rospy.spin()

if __name__ == "__main__":
    main()
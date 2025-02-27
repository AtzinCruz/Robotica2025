#!/usr/bin/env python
import rospy
import cv2
from sensor_msgs.msg import Image
from cv_bridge import CvBridge

def webcam_publisher():
    rospy.init_node('webcam_publisher', anonymous=True)
    image_pub = rospy.Publisher('/webcam/image_raw', Image, queue_size=10)
    bridge = CvBridge()
    
    # Captura de la webcam (0 es el índice predeterminado, ajusta si es necesario)
    cap = cv2.VideoCapture(0)
    if not cap.isOpened():
        rospy.logerr("No se pudo abrir la webcam")
        return
    
    rate = rospy.Rate(30)  # 30 Hz
    while not rospy.is_shutdown():
        ret, frame = cap.read()
        if ret:
            # Convertir el frame de OpenCV a mensaje ROS
            img_msg = bridge.cv2_to_imgmsg(frame, encoding="bgr8")
            img_msg.header.stamp = rospy.Time.now()
            image_pub.publish(img_msg)
        rate.sleep()
    
    cap.release()

if __name__ == '__main__':
    try:
        webcam_publisher()
    except rospy.ROSInterruptException:
        pass
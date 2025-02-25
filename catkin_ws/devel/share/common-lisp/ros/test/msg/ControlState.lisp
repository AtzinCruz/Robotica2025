; Auto-generated. Do not edit!


(cl:in-package test-msg)


;//! \htmlinclude ControlState.msg.html

(cl:defclass <ControlState> (roslisp-msg-protocol:ros-message)
  ((axes
    :reader axes
    :initarg :axes
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0))
   (buttons
    :reader buttons
    :initarg :buttons
    :type (cl:vector cl:integer)
   :initform (cl:make-array 0 :element-type 'cl:integer :initial-element 0))
   (hat
    :reader hat
    :initarg :hat
    :type (cl:vector cl:integer)
   :initform (cl:make-array 0 :element-type 'cl:integer :initial-element 0)))
)

(cl:defclass ControlState (<ControlState>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ControlState>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ControlState)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name test-msg:<ControlState> is deprecated: use test-msg:ControlState instead.")))

(cl:ensure-generic-function 'axes-val :lambda-list '(m))
(cl:defmethod axes-val ((m <ControlState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader test-msg:axes-val is deprecated.  Use test-msg:axes instead.")
  (axes m))

(cl:ensure-generic-function 'buttons-val :lambda-list '(m))
(cl:defmethod buttons-val ((m <ControlState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader test-msg:buttons-val is deprecated.  Use test-msg:buttons instead.")
  (buttons m))

(cl:ensure-generic-function 'hat-val :lambda-list '(m))
(cl:defmethod hat-val ((m <ControlState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader test-msg:hat-val is deprecated.  Use test-msg:hat instead.")
  (hat m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ControlState>) ostream)
  "Serializes a message object of type '<ControlState>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'axes))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-single-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)))
   (cl:slot-value msg 'axes))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'buttons))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let* ((signed ele) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    ))
   (cl:slot-value msg 'buttons))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'hat))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let* ((signed ele) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    ))
   (cl:slot-value msg 'hat))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ControlState>) istream)
  "Deserializes a message object of type '<ControlState>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'axes) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'axes)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-single-float-bits bits))))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'buttons) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'buttons)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:aref vals i) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296)))))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'hat) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'hat)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:aref vals i) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296)))))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ControlState>)))
  "Returns string type for a message object of type '<ControlState>"
  "test/ControlState")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ControlState)))
  "Returns string type for a message object of type 'ControlState"
  "test/ControlState")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ControlState>)))
  "Returns md5sum for a message object of type '<ControlState>"
  "1462100952344a6d9062ee185d9220e3")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ControlState)))
  "Returns md5sum for a message object of type 'ControlState"
  "1462100952344a6d9062ee185d9220e3")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ControlState>)))
  "Returns full string definition for message of type '<ControlState>"
  (cl:format cl:nil "float32[] axes~%int32[] buttons~%int32[] hat~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ControlState)))
  "Returns full string definition for message of type 'ControlState"
  (cl:format cl:nil "float32[] axes~%int32[] buttons~%int32[] hat~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ControlState>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'axes) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'buttons) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'hat) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ControlState>))
  "Converts a ROS message object to a list"
  (cl:list 'ControlState
    (cl:cons ':axes (axes msg))
    (cl:cons ':buttons (buttons msg))
    (cl:cons ':hat (hat msg))
))

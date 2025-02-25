;; Auto-generated. Do not edit!


(when (boundp 'test::ControlState)
  (if (not (find-package "TEST"))
    (make-package "TEST"))
  (shadow 'ControlState (find-package "TEST")))
(unless (find-package "TEST::CONTROLSTATE")
  (make-package "TEST::CONTROLSTATE"))

(in-package "ROS")
;;//! \htmlinclude ControlState.msg.html


(defclass test::ControlState
  :super ros::object
  :slots (_axes _buttons _hat ))

(defmethod test::ControlState
  (:init
   (&key
    ((:axes __axes) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:buttons __buttons) (make-array 0 :initial-element 0 :element-type :integer))
    ((:hat __hat) (make-array 0 :initial-element 0 :element-type :integer))
    )
   (send-super :init)
   (setq _axes __axes)
   (setq _buttons __buttons)
   (setq _hat __hat)
   self)
  (:axes
   (&optional __axes)
   (if __axes (setq _axes __axes)) _axes)
  (:buttons
   (&optional __buttons)
   (if __buttons (setq _buttons __buttons)) _buttons)
  (:hat
   (&optional __hat)
   (if __hat (setq _hat __hat)) _hat)
  (:serialization-length
   ()
   (+
    ;; float32[] _axes
    (* 4    (length _axes)) 4
    ;; int32[] _buttons
    (* 4    (length _buttons)) 4
    ;; int32[] _hat
    (* 4    (length _hat)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32[] _axes
     (write-long (length _axes) s)
     (dotimes (i (length _axes))
       (sys::poke (elt _axes i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;; int32[] _buttons
     (write-long (length _buttons) s)
     (dotimes (i (length _buttons))
       (write-long (elt _buttons i) s)
       )
     ;; int32[] _hat
     (write-long (length _hat) s)
     (dotimes (i (length _hat))
       (write-long (elt _hat i) s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32[] _axes
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _axes (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _axes i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     ))
   ;; int32[] _buttons
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _buttons (instantiate integer-vector n))
     (dotimes (i n)
     (setf (elt _buttons i) (sys::peek buf ptr- :integer)) (incf ptr- 4)
     ))
   ;; int32[] _hat
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _hat (instantiate integer-vector n))
     (dotimes (i n)
     (setf (elt _hat i) (sys::peek buf ptr- :integer)) (incf ptr- 4)
     ))
   ;;
   self)
  )

(setf (get test::ControlState :md5sum-) "1462100952344a6d9062ee185d9220e3")
(setf (get test::ControlState :datatype-) "test/ControlState")
(setf (get test::ControlState :definition-)
      "float32[] axes
int32[] buttons
int32[] hat

")



(provide :test/ControlState "1462100952344a6d9062ee185d9220e3")



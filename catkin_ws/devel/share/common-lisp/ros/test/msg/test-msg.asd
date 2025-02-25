
(cl:in-package :asdf)

(defsystem "test-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "ControlState" :depends-on ("_package_ControlState"))
    (:file "_package_ControlState" :depends-on ("_package"))
  ))
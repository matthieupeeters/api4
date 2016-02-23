;;;; api4.asd

(asdf:defsystem #:api4
  :description "Describe api4 here"
  :author "Your Name <your.name@example.com>"
  :license "Specify license here"
  :depends-on (#:yason
               #:hunchentoot
               #:cl-dbi
               #:alexandria
               #:sxql)
  :serial t
  :components ((:file "package")
               (:file "api4")))


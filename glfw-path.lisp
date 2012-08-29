(ql:quickload '(cl-glfw cl-opengl cl-glu))

(defpackage :g
  (:use :cl :gl))

(in-package :g)

(defun draw ()
  (clear :color-buffer-bit)
  (load-identity)
  (translate 0 0 -5)
  (rotate (* 10 (float (glfw:get-time) 0.0)) 1 1 0)
  (rotate (* 90 (float (glfw:get-time) 0.0)) 0 0 1)
  (begin :triangles)
  (color 1 0 0) (vertex  1  0 0)
  (color 0 1 0) (vertex -1  1 0)
  (color 0 0 1) (vertex -1 -1 0)
  (end))

(glfw:do-window (:title "A Simple cl-opengl Example")
    ((matrix-mode :projection)
     (load-identity)
     (unwind-protect (glu:perspective 45 4/3 0.1 50)
       (matrix-mode :modelview)))
  (when (eql (glfw:get-key glfw:+key-esc+) glfw:+press+)
    (return-from glfw::do-open-window))
  (draw))

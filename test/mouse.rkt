#lang racket

(require raylib-2d
         raylib-2d/util
         raylib-2d/colors)

(InitWindow 600 480 "Mouse test")

; Very low fps as to easily notice the press/release methods, since they're active for single frame.
(SetTargetFPS 2)

(raylib-basic-loop
    (define lines
      (list
        (~a "m1 pressed: " (IsMouseButtonPressed 'MOUSE_LEFT_BUTTON))
        (~a "m1 released: " (IsMouseButtonReleased 'MOUSE_LEFT_BUTTON))
        (~a "m1 down: " (IsMouseButtonDown 'MOUSE_LEFT_BUTTON))
        (~a "m1 up: " (IsMouseButtonUp 'MOUSE_LEFT_BUTTON))
        (~a "m2 pressed: " (IsMouseButtonPressed 'MOUSE_RIGHT_BUTTON))
        (~a "m2 released: " (IsMouseButtonReleased 'MOUSE_RIGHT_BUTTON))
        (~a "m2 down: " (IsMouseButtonDown 'MOUSE_RIGHT_BUTTON))
        (~a "m2 up: " (IsMouseButtonUp 'MOUSE_RIGHT_BUTTON))
        (~a "mouse x: " (GetMouseX))
        (~a "mouse y: " (GetMouseY))
        (~a "mouse scroll: " (GetMouseWheelMove))
        ))
    (begin-drawing
      (ClearBackground RAYWHITE)
      (for-each (lambda (line i)
                  (DrawText line 10 (* 10 i) 8 GRAY))
                lines
                (range (length lines)))))

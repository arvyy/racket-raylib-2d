#lang racket

(require raylib-2d
         raylib-2d/util
         raylib-2d/colors)

(InitWindow 600 480 "Keyboard test")

; Very low fps as to easily notice the press/release methods, since they're active for single frame.
(SetTargetFPS 2)

(raylib-basic-loop
    (define lines
      (list
        (~a "space pressed: " (IsKeyPressed 'KEY_SPACE))
        (~a "space released: " (IsKeyReleased 'KEY_SPACE))
        (~a "space down: " (IsKeyDown 'KEY_SPACE))
        (~a "space up: " (IsKeyUp 'KEY_SPACE))
        (~a "key pressed: " (GetKeyPressed))
        ))
    (begin-drawing
      (ClearBackground RAYWHITE)
      (for-each (lambda (line i)
                  (DrawText line 10 (* 10 i) 8 GRAY))
                lines
                (range (length lines)))))

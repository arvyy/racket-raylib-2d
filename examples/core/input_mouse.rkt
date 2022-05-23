#lang racket

(require raylib-2d
         raylib-2d/util
         raylib-2d/colors
         raylib-2d/enums)

(define screenWidth 800)
(define screenHeight 450)

(InitWindow screenWidth screenHeight "raylib [core] example - mouse input")

(define ballPosition (make-Vector2 -100.0 -100.0))
(define ballColor DARKBLUE)

(SetTargetFPS 60)


;; main game loop
(raylib-basic-loop
 (set! ballPosition (GetMousePosition))
 (cond
   ;; The commented out buttons are not implemented in version 0.0 of the library
   [(IsMouseButtonPressed 'MOUSE_LEFT_BUTTON) (set! ballColor MAROON)]
   [(IsMouseButtonPressed 'MOUSE_RIGHT_BUTTON) (set! ballColor DARKBLUE)]   
   [(IsMouseButtonPressed 'MOUSE_MIDDLE_BUTTON) (set! ballColor LIME)])
   ;; [(IsMouseButtonPressed 'MOUSE_SIDE_BUTTON) (set! ballColor PURPLE)]
   ;; [(IsMouseButtonPressed 'MOUSE_EXTRA_BUTTON) (set! ballColor YELLOW)]
   ;; [(IsMouseButtonPressed 'MOUSE_FORWARD_BUTTON) (set! ballColor ORANGE)]
   ;; [(IsMouseButtonPressed 'MOUSE_BACK_BUTTON) (set! ballColor BEIGE)])
 (begin-drawing
   (ClearBackground RAYWHITE)

   (DrawCircleV ballPosition 40.0 ballColor)
   (DrawText  "move the ball with the mouse and click button to change color" 10 10 20 DARKGRAY)   ))







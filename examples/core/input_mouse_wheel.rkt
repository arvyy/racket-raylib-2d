#lang racket

(require raylib-2d
         raylib-2d/util
         raylib-2d/colors
         raylib-2d/enums)

(define screenWidth 800)
(define screenHeight 450)

(InitWindow screenWidth screenHeight "raylib [core] example - input mouse weheel")

(define boxPositionY (- (/ screenHeight 2) 40))
(define scrollSpeed 4)

(SetTargetFPS 60)


;; main game loop
(raylib-basic-loop
 (set! boxPositionY (- boxPositionY (* (GetMouseWheelMove) scrollSpeed)))
 (begin-drawing
   (ClearBackground RAYWHITE)
   (DrawRectangle (- (/ screenHeight 2) 40) boxPositionY 80 80 MAROON)
   (DrawText  "Use mouse wheel to move the cuve up and down!" 10 10 20 GRAY)
   (DrawText  (format "Box position ~a" boxPositionY) 10 40 20 LIGHTGRAY))
 )







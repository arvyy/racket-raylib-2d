#lang racket

(require raylib-2d
         raylib-2d/util
         raylib-2d/colors
         raylib-2d/enums)

(define screenWidth 800)
(define screenHeight 450)

(InitWindow screenWidth screenHeight "raylib [core] example - keyboard input")

(SetTargetFPS 60)


(define ballPosition (make-Vector2 3.0 5.0))

;; main game loop
(raylib-basic-loop
 (cond
   [(IsKeyDown 'KEY_RIGHT) (set-Vector2-x! ballPosition
                                           (+ (Vector2-x ballPosition) 2.0))]
   [(IsKeyDown 'KEY_LEFT) (set-Vector2-x! ballPosition
                                          (- (Vector2-x ballPosition) 2.0))]
   [(IsKeyDown 'KEY_UP) (set-Vector2-y! ballPosition
                                          (- (Vector2-y ballPosition) 2.0))]
   [(IsKeyDown 'KEY_DOWN) (set-Vector2-y! ballPosition
                                          (+ (Vector2-y ballPosition) 2.0))]



   )
 (begin-drawing
   (ClearBackground RAYWHITE)
   (DrawText  "move the ball with the arrow keys" 10 10 20 DARKGRAY)
   (DrawCircleV ballPosition 50.0 MAROON)))







#lang racket
(require raylib-2d
         raylib-2d/util
         raylib-2d/colors)

(define screenWidth 800)
(define screenHeight 450)

;; Initialization
(InitWindow screenWidth screenHeight "raylib [core] example - basic window")

(SetTargetFPS 60) ; Set our game to run at 60 frames-per-second

(raylib-basic-loop
 (begin-drawing
   (ClearBackground RAYWHITE)
   (DrawText "Congrats! You created your first window!" 190 200 20 LIGHTGRAY)))
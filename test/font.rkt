#lang racket

(require raylib-2d
         raylib-2d/util
         raylib-2d/colors)

(SetTargetFPS 60)

(InitWindow 640 480 "Test font")
(define font (LoadFont (collection-file-path "test/resources/BebasNeueRegular.otf" "raylib-2d")))
(raylib-basic-loop
  (begin-drawing
    (ClearBackground RAYWHITE)
    (DrawTextEx font "Test" (make-Vector2 20. 20.) 60. 5. BLACK)))

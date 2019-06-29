#lang racket

(require raylib-2d
         raylib-2d/colors
         raylib-2d/util)

(SetTargetFPS 60)

(InitWindow 640 480 "Test camera")

(define cam (make-Camera2D (make-Vector2 320. 240.)
                           (make-Vector2 0. 0.)
                           0.0
                           1.0))

(raylib-basic-loop
  (define t (GetTime))
  (set-Camera2D-offset! cam (make-Vector2 (+ 320. (* 100.0 (cos t)))
                                          (+ 240. (* 100.0 (sin t)))))
  (set-Camera2D-rotation! cam (* t 45))
  (set-Camera2D-zoom! cam (+ 1.5 (* 0.5 (sin t))))
  (begin-drawing
    (ClearBackground RAYWHITE)
    (begin-mode2d (cam)
                  (DrawRectangle -60 -60 120 120 RED))))

#lang racket

(require raylib-2d
         raylib-2d/util
         raylib-2d/colors)

(InitWindow 600 480 "Shapes test")

(SetTargetFPS 60)

(raylib-basic-loop
    (begin-drawing
      (ClearBackground RAYWHITE)

      ;drawing pixels in a loop just so it's more visible that it works
        (for* ([x '(10 11 12)]
               [y '(10 11 12)])
          (DrawPixel x y RED)
          (DrawPixelV (make-Vector2 (exact->inexact (+ x 8)) 
                                    (exact->inexact y))
                     BLUE))
        
        (for* ([y '(16 17 18 19)]
               [x '(10)])
          (DrawLine x y (+ x 50) y RED)
          (DrawLineV (make-Vector2 (exact->inexact x)
                                   (exact->inexact (+ y 8)))
                     (make-Vector2 (exact->inexact (+ x 50))
                                   (exact->inexact (+ y 8)))
                     BLUE))

        (DrawLineEx (make-Vector2 10.0 32.0)
                    (make-Vector2 60.0 32.0)
                    4.0
                    PURPLE)

        (DrawLineBezier (make-Vector2 10.0 40.0)
                        (make-Vector2 60.0 60.0)
                        4.0
                        GREEN)

        (DrawLineStrip (list
                         (make-Vector2 10.0 70.0)
                         (make-Vector2 60.0 70.0)
                         (make-Vector2 60.0 80.0))
                       ORANGE)
        
         (DrawCircle 20 100 10.0 RED)

         (DrawCircleSector (make-Vector2 40.0 100.0) 10.0 45 180 3 GREEN)

         (DrawCircleSectorLines (make-Vector2 60.0 100.0) 10.0 45 180 3 ORANGE)

         (DrawCircleGradient 80 100 10.0 RED BLUE)

         (DrawCircleV (make-Vector2 100.0 100.0) 10.0 GRAY)

         (DrawCircleLines 20 100 10.0 PURPLE)

         (DrawRing (make-Vector2 20.0 120.0) 5.0 10.0 45 180 3 MAGENTA)

         (DrawRingLines (make-Vector2 40.0 120.0) 5.0 10.0 45 180 3 LIME)

         (DrawRectangle 10 140 40 10 RED)

         (DrawRectangleV (make-Vector2 60.0 140.0) (make-Vector2 40.0 10.0) BLUE)

         (DrawRectangleRec (make-Rectangle 110.0 140.0 40.0 10.0) GREEN)

         (DrawRectanglePro (make-Rectangle 160.0 140.0 40.0 10.0)
                           (make-Vector2 0.0 0.0)
                           45.0
                           GREEN)

         (DrawRectangleGradientV 10 160 40 10 RED BLUE)

         (DrawRectangleGradientH 60 160 40 10 RED BLUE)
        
         (DrawRectangleGradientEx (make-Rectangle 110.0 160.0 40.0 10.0) GREEN BLUE RED PURPLE)

         (DrawRectangleLines 10 180 40 10 RED)

         (DrawRectangleLinesEx (make-Rectangle 60.0 180.0 40.0 10.0) 4 GREEN)

         (DrawRectangleRounded (make-Rectangle 110.0 180.0 40.0 10.0) 0.5 4 BLUE)

         (DrawRectangleRoundedLines (make-Rectangle 160.0 180.0 40.0 10.0) 0.5 4 4 ORANGE)

         (DrawTriangle (make-Vector2 20.0 200.0)
                       (make-Vector2 10.0 220.0)
                       (make-Vector2 30.0 220.0)
                       LIME)

         (DrawTriangleLines (make-Vector2 50.0 200.0)
                            (make-Vector2 40.0 220.0)
                            (make-Vector2 60.0 220.0)
                            GRAY)

         (DrawPoly (make-Vector2 20.0 240.0) 5 10.0 45.0 RED)

         (DrawTriangleFan (list 
                            (make-Vector2 10.0 260.0)
                            (make-Vector2 30.0 260.0)
                            (make-Vector2 20.0 270.0)
                            (make-Vector2 50.0 270.0))
                          BLUE)
        ))

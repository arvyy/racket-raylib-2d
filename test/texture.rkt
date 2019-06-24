#lang racket

(require raylib-2d
		 raylib-2d/util
		 raylib-2d/colors
		 pkg/lib
		 racket/generator)


(define (draw-img img-gen pos comment)
  (define img (img-gen))
  (define texture (LoadTextureFromImage img))
  (begin-drawing
	(DrawTextureEx texture pos 0.0 0.25 WHITE))
	(DrawText comment 
			  (inexact->exact (Vector2-x pos))
			  (inexact->exact (Vector2-y pos))
			  10
			  BLACK)
  (UnloadTexture texture)
  (UnloadImage img))

(InitWindow 600 480 "Image/texture test")
(SetTargetFPS 1)

(define imgpath (build-path (pkg-directory "raylib-racket-2d") "test/resources/tileablebrick.png"))
(define brickimg (LoadImage imgpath))

(raylib-basic-loop

  (define pos-gen 
	(generator ()
	   (for* ([x (range 4)]
			  [y (range 4)])
		 (yield (make-Vector2 (exact->inexact (* 128 x))
							  (exact->inexact (* 128 y)))))))

  (draw-img (lambda()(ImageCopy brickimg)) (pos-gen) "Normal")
  (draw-img (lambda()(ImageCopy brickimg)) (pos-gen) "Normal")
  (draw-img (lambda()(ImageCopy brickimg)) (pos-gen) "Normal")
  (draw-img (lambda()(ImageCopy brickimg)) (pos-gen) "Normal")
  
  
  )

(UnloadImage brickimg)

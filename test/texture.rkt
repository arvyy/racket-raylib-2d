#lang racket

(require raylib-2d
		 raylib-2d/util
		 raylib-2d/colors
		 pkg/lib
		 racket/generator
		 ffi/unsafe)


(InitWindow 800 600 "Texture test")
(SetTargetFPS 30)

(define resources-path (build-path (pkg-directory "raylib-2d") "test/resources/"))
(define brickimage (let ([im (LoadImage (~a resources-path "tileablebrick.png"))])
	  (ImageCrop im (make-Rectangle 0.0 0.0 512.0 512.0))
	  (ImageResize im 64 64)
	  im))

(define gridimage (GenImageChecked 60 60 5 5 BLUE GRAY))

(define t1 (LoadTextureFromImage brickimage))
(SetTextureWrap t1 'WRAP_REPEAT)

(define t2 (LoadTextureFromImage brickimage))
(SetTextureWrap t2 'WRAP_CLAMP)

(define t3 (LoadTextureFromImage brickimage))
(SetTextureWrap t3 'WRAP_MIRROR_REPEAT)

(define t4 (LoadTextureFromImage brickimage))
(SetTextureWrap t4 'WRAP_MIRROR_CLAMP)

(define t5 (LoadTextureFromImage gridimage))
(SetTextureFilter t5 'FILTER_POINT)

(define t6 (LoadTextureFromImage gridimage))
(SetTextureFilter t6 'FILTER_BILINEAR)

(raylib-basic-loop
  (begin-drawing
	(DrawTexture t1 0 0 WHITE))
  	(DrawTextureV t1 (make-Vector2 64.0 0.0) WHITE)
	(DrawTextureEx t1 (make-Vector2 128.0 0.0) 45.0 0.5 WHITE)
	(DrawTextureRec t1 (make-Rectangle 0.0 0.0 64.0 64.0) (make-Vector2 128.0 0.0) WHITE)
	(DrawTextureQuad t1 (make-Vector2 4.0 1.0) (make-Vector2 0.5 0.5) (make-Rectangle 0.0 64.0 512.0 64.0) WHITE)
	(DrawTexturePro t1 
					(make-Rectangle 0.0 0.0 64.0 64.0) 
					(make-Rectangle 0.0 128.0 512.0 64.0)
					(make-Vector2 0.0 0.0)
					0.0
					WHITE)

	(DrawTextureRec t1 (make-Rectangle -32.0 -32.0 128.0 128.0) (make-Vector2 0.0 192.0) WHITE)
	(DrawTextureRec t2 (make-Rectangle -32.0 -32.0 128.0 128.0) (make-Vector2 128.0 192.0) WHITE)
	(DrawTextureRec t3 (make-Rectangle -32.0 -32.0 128.0 128.0) (make-Vector2 256.0 192.0) WHITE)
	(DrawTextureRec t4 (make-Rectangle -32.0 -32.0 128.0 128.0) (make-Vector2 384.0 192.0) WHITE)

	(DrawTexturePro t5 
					(make-Rectangle 0.0 0.0 60.0 60.0)
					(make-Rectangle 64.0 320.0 128.0 128.0)
					(make-Vector2 0.0 0.0)
					45.0
					WHITE)

	(DrawTexturePro t6
					(make-Rectangle 0.0 0.0 60.0 60.0)
					(make-Rectangle 256.0 320.0 128.0 128.0)
					(make-Vector2 0.0 0.0)
					45.0
					WHITE)

	(DrawTextureNPatch t5
					   (make-NPatchInfo (make-Rectangle 0.0 0.0 60.0 60.0)
										10 10 10 10
										'NPT_9PATCH)
					   (make-Rectangle 512.0 320.0 256.0 256.0)
					   (make-Vector2 0.0 0.0)
					   0.0
					   WHITE)
  )

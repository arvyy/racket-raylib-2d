#lang racket

(require raylib-2d
		 raylib-2d/util
		 raylib-2d/colors
		 pkg/lib
		 racket/generator
		 ffi/unsafe)

(SetTraceLogLevel 'LOG_NONE)
(InitWindow 800 600 "Image test")
(SetTargetFPS 30)

(define resources-path (build-path (pkg-directory "raylib-racket-2d") "test/resources/"))
(define brickimg (LoadImage (~a resources-path "tileablebrick.png")))

(define alphaimg (LoadImage (~a resources-path "alphamask.png")))
(ImageResize alphaimg 1024 1024)

(define images
  `(("Normal" . ,(ImageCopy brickimg))
	("Alpha masked" . ,(let ([img (ImageCopy brickimg)])
						 (ImageAlphaMask img alphaimg)
						 img))
	("Alpha clear" . ,(let ([img (ImageCopy brickimg)])
						(ImageAlphaMask img alphaimg)
						(ImageAlphaClear img RED 0.5)
						img))
	("Alpha crop" . ,(let ([img (ImageCopy brickimg)])
						(ImageAlphaMask img alphaimg)
						(ImageAlphaCrop img 1.0)
						img))
	("Image crop" . ,(let ([img (ImageCopy brickimg)])
					   (ImageCrop img (make-Rectangle 0.0 0.0 512.0 512.0))
					   img))
	("Image resize" . ,(let ([img (ImageCopy brickimg)])
						 (ImageCrop img (make-Rectangle 0.0 0.0 512.0 512.0))
						 (ImageResize img 1024 1024)
						 img))
	("Image resize NN" . ,(let ([img (ImageCopy brickimg)])
							(ImageCrop img (make-Rectangle 0.0 0.0 512.0 512.0))
							(ImageResizeNN img 1024 1024)
							img))
	("Image dither" . ,(let ([img (ImageCopy brickimg)])
							(ImageDither img 4 4 4 4)
							img))
	("Image text" . ,(ImageText "test" 512 BLACK))
	("Image draw" . ,(let ([img (ImageCopy brickimg)])
					   (ImageDraw img 
								  alphaimg
								  (make-Rectangle 0.0 0.0 1024.0 1024.0)
								  (make-Rectangle 256.0 256.0 512.0 512.0))
					   img))
	("Flip vertical" . ,(let ([img (ImageCopy brickimg)])
						  (ImageFlipVertical img)
						  img))
	("Flip horizontal" . ,(let ([img (ImageCopy brickimg)])
							(ImageFlipHorizontal img)
							img))
	("Rotate cw" . ,(let ([img (ImageCopy brickimg)])
						  (ImageRotateCW img)
						  img))
	("Rotate ccw" . ,(let ([img (ImageCopy brickimg)])
					   (ImageRotateCCW img)
					   img))
	("Color tint" . ,(let ([img (ImageCopy brickimg)])
					   (ImageColorTint img BLUE)
					   img))
	("Color invert" . ,(let ([img (ImageCopy brickimg)])
					   (ImageColorInvert img)
					   img))
	("Grayscale" . ,(let ([img (ImageCopy brickimg)])
					   (ImageColorGrayscale img)
					   img))
	("Contrast" . ,(let ([img (ImageCopy brickimg)])
					   (ImageColorContrast img 50.0)
					   img))
	("Brightness" . ,(let ([img (ImageCopy brickimg)])
					   (ImageColorBrightness img 100)
					   img))
	("Color replace" . ,(let ([img (ImageCopy alphaimg)])
						  (ImageColorReplace img BLACK BLUE)
						  img))
	("Plain color" . ,(GenImageColor 1024 1024 BLUE))
	("Gradient color V" . ,(GenImageGradientV 1024 1024 BLUE GREEN))
	("Gradient color H" . ,(GenImageGradientH 1024 1024 BLUE GREEN))
	("Gradient color radial" . ,(GenImageGradientRadial 1024 1024 0.5 BLUE GREEN))
	("Checked" . ,(GenImageChecked 1024 1024 32 32 BLUE GREEN))
	("White noise" . ,(GenImageWhiteNoise 1024 1024 0.5))
	("Perlin noise" . ,(GenImagePerlinNoise 1024 1024 50 50 0.5))
	("Cellular" . ,(GenImageCellular 1024 1024 100))
	
	))

(define textures 
  (map (lambda(im)
		 (define texture (LoadTextureFromImage (cdr im)))
		 (UnloadImage (cdr im))
		 (cons (car im) texture)) 
	   images))

(raylib-basic-loop

  (define pos-gen 
	(generator ()
	   (for* ([y (range 10)]
			  [x (range 7)])
		 (yield (make-Vector2 (exact->inexact (* 96 x))
							  (exact->inexact (* 96 y)))))))
  
  (begin-drawing
	(for-each (lambda (e)
				(define pos (pos-gen))
				(define texture (cdr e))
				(define comment (car e))
				(DrawTextureEx texture pos 0.0 (/ 96.0 1024.0) WHITE)
				(DrawText comment 
						  (inexact->exact (Vector2-x pos))
						  (+ 10 (inexact->exact (Vector2-y pos)))
						  10
						  WHITE))
			  textures)))

(for-each (lambda(e)
			(displayln (Texture2D-id (cdr e)))
			(UnloadTexture (cdr e))) textures)

(UnloadImage brickimg)

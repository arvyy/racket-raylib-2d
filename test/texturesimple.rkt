#lang racket

(require raylib-2d
		 raylib-2d/util
		 raylib-2d/colors
		 pkg/lib
		 racket/generator
		 ffi/unsafe)


(InitWindow 600 480 "Image/texture test")
(SetTargetFPS 30)

(define resources-path (build-path (pkg-directory "raylib-racket-2d") "test/resources/"))
(define brickimg (LoadImage (~a resources-path "tileablebrick.png")))

(define img (ImageCopy brickimg))
(define bricktexture (LoadTextureFromImage (ImageCopy img)))
(UnloadImage img)

(UnloadTexture bricktexture)
(UnloadImage brickimg)

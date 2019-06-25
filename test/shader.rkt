#lang racket

(require raylib-2d
		 raylib-2d/util
		 raylib-2d/colors
		 ffi/unsafe
		 pkg/lib)

(InitWindow 512 512 "Shader test")

(define resources-path (build-path (pkg-directory "raylib-2d") "test/resources/"))
(define shader (LoadShader (~a resources-path "basic.vs")
						   (~a resources-path "basic.fs")))

(define shader-mult-loc (GetShaderLocation shader "mult"))
(define shader-mult-val-ptr (malloc _float 1))
(define shader-mult-val-arr (ptr-ref shader-mult-val-ptr (_array _float 1) 0))

(define texture (LoadTexture (~a resources-path "tileablebrick.png")))


(SetTargetFPS 60)

(raylib-basic-loop
  (array-set! shader-mult-val-arr 0 (abs (sin (GetTime))))
  (SetShaderValue shader shader-mult-loc shader-mult-val-ptr 'UNIFORM_FLOAT)
  (begin-drawing
	(begin-shader-mode (shader)
		(DrawTexture texture 0 0 WHITE))
	))

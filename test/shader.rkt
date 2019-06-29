#lang racket

(require raylib-2d
         raylib-2d/util
         raylib-2d/colors
         ffi/unsafe
         pkg/lib)

(InitWindow 512 512 "Shader test")

(define (resource-path resource)
  (collection-file-path (~a "test/resources/" resource) "raylib-2d"))
(define shader (LoadShader (resource-path "basic.vs")
                           (resource-path "basic.fs")))

(define shader-mult-loc (GetShaderLocation shader "mult"))
(define shader-mult-val-ptr (malloc _float 1))
(define shader-mult-val-arr (ptr-ref shader-mult-val-ptr (_array _float 1) 0))

(define texture (LoadTexture (resource-path "tileablebrick.png")))


(SetTargetFPS 60)

(raylib-basic-loop
  (array-set! shader-mult-val-arr 0 (abs (sin (GetTime))))
  (SetShaderValue shader shader-mult-loc shader-mult-val-ptr 'UNIFORM_FLOAT)
  (begin-drawing
    (begin-shader-mode (shader)
                       (DrawTexture texture 0 0 WHITE))))

#lang racket/base

(require raylib-2d)

(provide (all-defined-out))

(define-syntax raylib-basic-loop
  (syntax-rules ()
    [(_ body ...)
     (let it ([close? #f])
       body ...
       (if close?
         (CloseWindow)
         (it (WindowShouldClose))))]))

(define-syntax begin-block-stx
  (syntax-rules ()
    [(_ (begin-fn begin-fn-args ...) (end-fn) body ...)
     (begin
       (begin-fn begin-fn-args ...)
       body ...
       (end-fn))]))

(define-syntax begin-drawing
  (syntax-rules ()
    [(_ body ...) (begin-block-stx (BeginDrawing) (EndDrawing) body ...)]))

(define-syntax begin-mode2d
  (syntax-rules ()
    [(_ (cam) body ...) (begin-block-stx (BeginMode2D cam) (EndMode2D) body ...)]))

(define-syntax begin-texture-mode
  (syntax-rules ()
    [(_ (texture) body ...) (begin-block-stx (BeginTextureMode texture) (EndTextureMode) body ...)]))

(define-syntax begin-shader-mode
  (syntax-rules ()
    [(_ (shader) body ...) (begin-block-stx (BeginShaderMode shader) (EndShaderMode) body ...)]))

(define-syntax begin-blend-mode
  (syntax-rules ()
    [(_ (blend) body ...) (begin-block-stx (BeginBlendMode blend) (EndBlendMode) body ...)]))

(define-syntax begin-scissor-mode
  (syntax-rules ()
    [(_ (x y width height) body ...) (begin-block-stx (BeginScissorMode x y width height) (EndScissorMode) body ...)]))

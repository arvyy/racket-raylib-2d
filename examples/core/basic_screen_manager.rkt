#lang racket
(require raylib-2d
         raylib-2d/util
         raylib-2d/colors
         raylib-2d/enums)

(define screenWidth 800)
(define screenHeight 450)
(define STATE 'GAMEPLAY)

;; Initialization
(InitWindow screenWidth screenHeight "raylib [core] example - basic screen manager")

(define framesCounter 0) ;; Useful to count frames

(SetTargetFPS 60) ; Set our game to run at 60 frames-per-second
;; IsGestureDetected is either not configured in racket-raylib-2d or is not raylib 2.5

;; main game loop
(raylib-basic-loop
 (match STATE
   ['LOGO (begin
           (set! framesCounter (add1 framesCounter))
           (when (<  120 framesCounter)
             (set! STATE 'TITLE)))]
   ['TITLE (begin
            (when (IsKeyPressed 'KEY_ENTER)
              (set! STATE 'GAMEPLAY)))]
   ['GAMEPLAY (begin
            (when (IsKeyPressed 'KEY_ENTER)
              (set! STATE 'ENDING)))]
   ['ENDING (begin
            (when (IsKeyPressed 'KEY_ENTER)
              (set! STATE 'TITLE)))]) 

 (begin-drawing
   (ClearBackground RAYWHITE)
   (match STATE
     ['LOGO (begin
             (DrawText "LOGO SCREEN" 20 20 40 LIGHTGRAY)
             (DrawText "WAIT for 2 SECONDS..." 290 220 20 GRAY))]
     ['TITLE (begin
              (DrawRectangle 0 0 screenWidth screenHeight GREEN)
              (DrawText "TITLE SCREEN" 20 20 40 LIGHTGRAY)
              (DrawText "PRESS Enter or TAP to JUMP to GAMEPLAY SCREEN" 120 220 20 DARKGREEN))]
     
     ['GAMEPLAY (begin
                 (DrawRectangle 0 0 screenWidth screenHeight PURPLE)
                 (DrawText "GAMEPLAY SCREEN" 20 20 40 MAROON)
                 (DrawText "PRESS Enter or TAP to RETURN to ENDING SCREEN" 120 220 20 MAROON))]
     ['ENDING (begin
               (DrawRectangle 0 0 screenWidth screenHeight BLUE)
               (DrawText "ENDING SCREEN" 20 20 40 DARKBLUE)
               (DrawText "PRESS Enter or TAP to RETURN to TITLE SCREEN" 120 220 20 DARKBLUE))])))




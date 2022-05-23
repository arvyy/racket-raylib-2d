NOTE
====

These are partial bindings for an old raylib version. Anyone starting a new project should look at https://github.com/eutro/racket-raylib instead.

racket-raylib-2d
================
Racket bindings for 2D graphics functionality part of Raylib library v2.5 (https://github.com/raysan5/raylib).

* enums.rkt contains enum definitions (`(require raylib-2d/enums)`)
* structs.rkt contains struct definitions (`(require raylib-2d/structs)`)
* functions.rkt contains function definitions (`(require raylib-2d/functions)`)

above 3 modules are reexported in main.rkt (`(require raylib-2d)`)

* colors.rkt contains raylib color pallette (a handful `Color` struct constants) (`(require raylib-2d/colors)`)
* util.rkt contains various syntax definitions - 1 for basic game loop, and a couple for begin/end kind of functions (`(require raylib-2d/util)`)

* To install: `raco pkg install https://github.com/arvyy/racket-raylib-2d.git`.
* To run test: `racket -l raylib-2d/test/<testname>`, e.g.  `racket -l raylib-2d/test/shape`

Tests aren't unit tests -- moreso it's just an invocation of a bunch of related functions to confirm that calling the wrapped function does not crash the program. 


## Documentation

Core examples from the [Raylib](https://www.raylib.com/examples.html) website can be found in the examples/core

### Installation
#### Windows
1. Go to [release page](https://github.com/raysan5/raylib/releases) for Raylib  and scroll down to raylib v2.5.0
2. Download raylib-2.5.0-Win64-mingw.zip
3. Open Dr. Racket, Racket on the cmdline, or your favorite text editor and run this code to find out where Racket looks dynamically linked libraries 

```
#lang racket
(require setup/dirs)
(get-lib-search-dirs)
```
4. extract the libraylib.dll in the bin folder and put in one of the locations returned by `(get-lib-search-dirs)`.
5. Install racket-raylib-2d if it isn't already with `raco pkg install racket-raylib-2d`
6. Run the example code in examples/core/basic_window.rkt

```
#lang racket
(require raylib-2d
         raylib-2d/util
         raylib-2d/colors)

(define screenWidth 800)
(define screenHeight 450)

;; Initialization
(InitWindow screenWidth screenHeight "raylib [core] example - basic window")

(SetTargetFPS 60) ; Set our game to run at 60 frames-per-second

(raylib-basic-loop
 (begin-drawing
   (ClearBackground RAYWHITE)
   (DrawText "Congrats! You created your first window!" 190 200 20 LIGHTGRAY)))
```


### references

1. https://docs.racket-lang.org/raco/dirs.html#%28def._%28%28lib._setup%2Fdirs..rkt%29._get-lib-search-dirs%29%29

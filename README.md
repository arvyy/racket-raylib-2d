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

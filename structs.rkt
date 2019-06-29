#lang racket/base


(require ffi/unsafe
         "enums.rkt")

(provide (all-defined-out))

#;(
// Vector2 type
typedef struct Vector2 {
    float x;
    float y;
} Vector2;
)
(define-cstruct _Vector2 ([x _float]
                          [y _float]))

#;(
// Vector3 type
typedef struct Vector3 {
    float x;
    float y;
    float z;
} Vector3;
)
(define-cstruct _Vector3 ([x _float]
                          [y _float]
                          [z _float]))

#;(
// Vector4 type
typedef struct Vector4 {
    float x;
    float y;
    float z;
    float w;
} Vector4;
)
(define-cstruct _Vector4 ([x _float]
                          [y _float]
                          [z _float]
                          [w _float]))


#;(
// Matrix type (OpenGL style 4x4 - right handed, column major)
typedef struct Matrix {
    float m0, m4, m8, m12;
    float m1, m5, m9, m13;
    float m2, m6, m10, m14;
    float m3, m7, m11, m15;
} Matrix;
)
(define-cstruct _Matrix ([m0 _float]
                         [m1 _float]
                         [m2 _float]
                         [m3 _float]
                         [m4 _float]
                         [m5 _float]
                         [m6 _float]
                         [m7 _float]
                         [m8 _float]
                         [m9 _float]
                         [m10 _float]
                         [m11 _float]
                         [m12 _float]
                         [m13 _float]
                         [m14 _float]
                         [m15 _float]))

#;(
// Color type, RGBA (32bit)
typedef struct Color {
    unsigned char r;
    unsigned char g;
    unsigned char b;
    unsigned char a;
} Color;
)
(define-cstruct _Color ([r _ubyte]
                        [g _ubyte]
                        [b _ubyte]
                        [a _ubyte]))

#;(
// Rectangle type
typedef struct Rectangle {
    float x;
    float y;
    float width;
    float height;
} Rectangle;
)
(define-cstruct _Rectangle ([x _float]
                            [y _float]
                            [width _float]
                            [height _float]))

#;(
// Image type, bpp always RGBA (32bit)
// NOTE: Data stored in CPU memory (RAM)
typedef struct Image {
    void *data;             // Image raw data
    int width;              // Image base width
    int height;             // Image base height
    int mipmaps;            // Mipmap levels, 1 by default
    int format;             // Data format (PixelFormat type)
} Image;
)
(define-cstruct _Image ([data _pointer]
                        [width _int]
                        [height _int]
                        [mipmaps _int]
                        [format _int]))

#;(
// Texture2D type
// NOTE: Data stored in GPU memory
typedef struct Texture2D {
    unsigned int id;        // OpenGL texture id
    int width;              // Texture base width
    int height;             // Texture base height
    int mipmaps;            // Mipmap levels, 1 by default
    int format;             // Data format (PixelFormat type)
} Texture2D;
)
(define-cstruct _Texture2D ([id _uint]
                            [width _int]
                            [height _int]
                            [mipmaps _int]
                            [format _PixelFormat]))

#;(
// Texture type, same as Texture2D
typedef Texture2D Texture;
)
(define-cstruct (_Texture _Texture2D) ())

#;(
// RenderTexture2D type, for texture rendering
typedef struct RenderTexture2D {
    unsigned int id;        // OpenGL Framebuffer Object (FBO) id
    Texture2D texture;      // Color buffer attachment texture
    Texture2D depth;        // Depth buffer attachment texture
    bool depthTexture;      // Track if depth attachment is a texture or renderbuffer
} RenderTexture2D;
)
(define-cstruct _RenderTexture2D ([id _uint]
                                  [texture _Texture2D]
                                  [depth _Texture2D]
                                  [depthTexture _bool]))

#;(
// RenderTexture type, same as RenderTexture2D
typedef RenderTexture2D RenderTexture;
)
(define-cstruct (_RenderTexture _RenderTexture2D) ())

#;(
// N-Patch layout info
typedef struct NPatchInfo {
    Rectangle sourceRec;   // Region in the texture
    int left;              // left border offset
    int top;               // top border offset
    int right;             // right border offset
    int bottom;            // bottom border offset
    int type;              // layout of the n-patch: 3x3, 1x3 or 3x1
} NPatchInfo;
)
(define-cstruct _NPatchInfo ([sourceRec _Rectangle]
                             [left _int]
                             [top _int]
                             [right _int]
                             [bottm _int]
                             [type _NPatchType]))

#;(
// Font character info
typedef struct CharInfo {
    int value;              // Character value (Unicode)
    Rectangle rec;          // Character rectangle in sprite font
    int offsetX;            // Character offset X when drawing
    int offsetY;            // Character offset Y when drawing
    int advanceX;           // Character advance position X
    unsigned char *data;    // Character pixel data (grayscale)
} CharInfo;
)
(define-cstruct _CharInfo ([value _int]
                           [rec _Rectangle]
                           [offsetX _int]
                           [offsetY _int]
                           [advanceX _int]
                           [data _pointer]))

#;(
// Font type, includes texture and charSet array data
typedef struct Font {
    Texture2D texture;      // Font texture
    int baseSize;           // Base size (default chars height)
    int charsCount;         // Number of characters
    CharInfo *chars;        // Characters info data
} Font;
)
(define-cstruct _Font ([texture _Texture2D]
                       [baseSize _int]
                       [charsCount _int]
                       [chars _CharInfo-pointer]))

#;(
;#define SpriteFont Font     // SpriteFont type fallback, defaults to Font
)
(define-cstruct (_SpriteFont _Font) ())

#;(
// Camera2D type, defines a 2d camera
typedef struct Camera2D {
    Vector2 offset;         // Camera offset (displacement from target)
    Vector2 target;         // Camera target (rotation and zoom origin)
    float rotation;         // Camera rotation in degrees
    float zoom;             // Camera zoom (scaling), should be 1.0f by default
} Camera2D;
)
(define-cstruct _Camera2D ([offset _Vector2]
                           [target _Vector2]
                           [rotation _float]
                           [zoom _float]))

#;(
// Shader type (generic)
typedef struct Shader {
    unsigned int id;                // Shader program id
    int locs[MAX_SHADER_LOCATIONS]; // Shader locations array
} Shader;
)
(define MAX_SHADER_LOCATIONS 32)
(define-cstruct _Shader ([id _uint]
                         [locs (_array _int MAX_SHADER_LOCATIONS)]))


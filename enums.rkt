#lang racket/base

(require ffi/unsafe)

(provide (all-defined-out))
;----------------------------------------------------------------------------------
; Enumerators Definition
;----------------------------------------------------------------------------------
; System config flags
; NOTE: Used for bit masks
(define _ConfigFlag
  (_bitmask '(
    FLAG_SHOW_LOGO          = 1    ; Set to show raylib logo at startup
    FLAG_FULLSCREEN_MODE    = 2    ; Set to run program in fullscreen
    FLAG_WINDOW_RESIZABLE   = 4    ; Set to allow resizable window
    FLAG_WINDOW_UNDECORATED = 8    ; Set to disable window decoration (frame and buttons)
    FLAG_WINDOW_TRANSPARENT = 16   ; Set to allow transparent window
    FLAG_WINDOW_HIDDEN      = 128  ; Set to create the window initially hidden
    FLAG_MSAA_4X_HINT       = 32   ; Set to try enabling MSAA 4X
    FLAG_VSYNC_HINT         = 64    ; Set to try enabling V-Sync on GPU
	)))

; Trace log type
(define _TraceLogType
  (_enum
	'(
	   LOG_ALL = 0        
	   LOG_TRACE
	   LOG_DEBUG
	   LOG_INFO
	   LOG_WARNING
	   LOG_ERROR
	   LOG_FATAL
	   LOG_NONE
	  )))

; Keyboard keys
(define _KeyboardKey
  (_enum
	'(
    KEY_NONE            = 4294967295
    ; Alphanumeric keys
    KEY_APOSTROPHE      = 39
    KEY_COMMA           = 44
    KEY_MINUS           = 45
    KEY_PERIOD          = 46
    KEY_SLASH           = 47
    KEY_ZERO            = 48
    KEY_ONE             = 49
    KEY_TWO             = 50
    KEY_THREE           = 51
    KEY_FOUR            = 52
    KEY_FIVE            = 53
    KEY_SIX             = 54
    KEY_SEVEN           = 55
    KEY_EIGHT           = 56
    KEY_NINE            = 57
    KEY_SEMICOLON       = 59
    KEY_EQUAL           = 61
    KEY_A               = 65
    KEY_B               = 66
    KEY_C               = 67
    KEY_D               = 68
    KEY_E               = 69
    KEY_F               = 70
    KEY_G               = 71
    KEY_H               = 72
    KEY_I               = 73
    KEY_J               = 74
    KEY_K               = 75
    KEY_L               = 76
    KEY_M               = 77
    KEY_N               = 78
    KEY_O               = 79
    KEY_P               = 80
    KEY_Q               = 81
    KEY_R               = 82
    KEY_S               = 83
    KEY_T               = 84
    KEY_U               = 85
    KEY_V               = 86
    KEY_W               = 87
    KEY_X               = 88
    KEY_Y               = 89
    KEY_Z               = 90

    ; Function keys
    KEY_SPACE           = 32
    KEY_ESCAPE          = 256
    KEY_ENTER           = 257
    KEY_TAB             = 258
    KEY_BACKSPACE       = 259
    KEY_INSERT          = 260
    KEY_DELETE          = 261
    KEY_RIGHT           = 262
    KEY_LEFT            = 263
    KEY_DOWN            = 264
    KEY_UP              = 265
    KEY_PAGE_UP         = 266
    KEY_PAGE_DOWN       = 267
    KEY_HOME            = 268
    KEY_END             = 269
    KEY_CAPS_LOCK       = 280
    KEY_SCROLL_LOCK     = 281
    KEY_NUM_LOCK        = 282
    KEY_PRINT_SCREEN    = 283
    KEY_PAUSE           = 284
    KEY_F1              = 290
    KEY_F2              = 291
    KEY_F3              = 292
    KEY_F4              = 293
    KEY_F5              = 294
    KEY_F6              = 295
    KEY_F7              = 296
    KEY_F8              = 297
    KEY_F9              = 298
    KEY_F10             = 299
    KEY_F11             = 300
    KEY_F12             = 301
    KEY_LEFT_SHIFT      = 340
    KEY_LEFT_CONTROL    = 341
    KEY_LEFT_ALT        = 342
    KEY_LEFT_SUPER      = 343
    KEY_RIGHT_SHIFT     = 344
    KEY_RIGHT_CONTROL   = 345
    KEY_RIGHT_ALT       = 346
    KEY_RIGHT_SUPER     = 347
    KEY_KB_MENU         = 348
    KEY_LEFT_BRACKET    = 91
    KEY_BACKSLASH       = 92
    KEY_RIGHT_BRACKET   = 93
    KEY_GRAVE           = 96

    ; Keypad keys
    KEY_KP_0            = 320
    KEY_KP_1            = 321
    KEY_KP_2            = 322
    KEY_KP_3            = 323
    KEY_KP_4            = 324
    KEY_KP_5            = 325
    KEY_KP_6            = 326
    KEY_KP_7            = 327
    KEY_KP_8            = 328
    KEY_KP_9            = 329
    KEY_KP_DECIMAL      = 330
    KEY_KP_DIVIDE       = 331
    KEY_KP_MULTIPLY     = 332
    KEY_KP_SUBTRACT     = 333
    KEY_KP_ADD          = 334
    KEY_KP_ENTER        = 335
    KEY_KP_EQUAL        = 336
)))

; Mouse buttons
(define _MouseButton
  (_enum
	'(
    MOUSE_LEFT_BUTTON   = 0
    MOUSE_RIGHT_BUTTON  = 1
    MOUSE_MIDDLE_BUTTON = 2
)))

; Gamepad number
(define _GamepadNumber
  (_enum
	'(
    GAMEPAD_PLAYER1     = 0
    GAMEPAD_PLAYER2     = 1
    GAMEPAD_PLAYER3     = 2
    GAMEPAD_PLAYER4     = 3
	)))

; Gamepad Buttons
(define _GamepadButton
  (_enum
	'(
    ; This is here just for error checking
    GAMEPAD_BUTTON_UNKNOWN = 0

    ; This is normally [ABXY]/[CircleTriangleSquareCross]
    ; No support for 6 button controllers though..
    GAMEPAD_BUTTON_LEFT_FACE_UP
    GAMEPAD_BUTTON_LEFT_FACE_RIGHT
    GAMEPAD_BUTTON_LEFT_FACE_DOWN
    GAMEPAD_BUTTON_LEFT_FACE_LEFT
  
    ; This is normally a DPAD
    GAMEPAD_BUTTON_RIGHT_FACE_UP
    GAMEPAD_BUTTON_RIGHT_FACE_RIGHT
    GAMEPAD_BUTTON_RIGHT_FACE_DOWN
    GAMEPAD_BUTTON_RIGHT_FACE_LEFT

    ; Triggers
    GAMEPAD_BUTTON_LEFT_TRIGGER_1
    GAMEPAD_BUTTON_LEFT_TRIGGER_2
    GAMEPAD_BUTTON_RIGHT_TRIGGER_1
    GAMEPAD_BUTTON_RIGHT_TRIGGER_2

    ; These are buttons in the center of the gamepad
    GAMEPAD_BUTTON_MIDDLE_LEFT     ;PS3 Select
    GAMEPAD_BUTTON_MIDDLE          ;PS Button/XBOX Button
    GAMEPAD_BUTTON_MIDDLE_RIGHT    ;PS3 Start

    ; These are the joystick press in buttons
    GAMEPAD_BUTTON_LEFT_THUMB
    GAMEPAD_BUTTON_RIGHT_THUMB
	)))

(define _GamepadAxis
  (_enum
	'(
    ; This is here just for error checking
    GAMEPAD_AXIS_UNKNOWN = 0

    ; Left stick
    GAMEPAD_AXIS_LEFT_X
    GAMEPAD_AXIS_LEFT_Y

    ; Right stick
    GAMEPAD_AXIS_RIGHT_X
    GAMEPAD_AXIS_RIGHT_Y

    ; Pressure levels for the back triggers
    GAMEPAD_AXIS_LEFT_TRIGGER      ; [1..-1] (pressure-level)
    GAMEPAD_AXIS_RIGHT_TRIGGER      ; [1..-1] (pressure-level)
	)))

; Shader location point type
(define _ShaderLocationIndex
  (_enum
	'(
    LOC_VERTEX_POSITION = 0
    LOC_VERTEX_TEXCOORD01
    LOC_VERTEX_TEXCOORD02
    LOC_VERTEX_NORMAL
    LOC_VERTEX_TANGENT
    LOC_VERTEX_COLOR
    LOC_MATRIX_MVP
    LOC_MATRIX_MODEL
    LOC_MATRIX_VIEW
    LOC_MATRIX_PROJECTION
    LOC_VECTOR_VIEW
    LOC_COLOR_DIFFUSE
    LOC_COLOR_SPECULAR
    LOC_COLOR_AMBIENT
    LOC_MAP_ALBEDO          ; LOC_MAP_DIFFUSE
    LOC_MAP_METALNESS       ; LOC_MAP_SPECULAR
    LOC_MAP_NORMAL
    LOC_MAP_ROUGHNESS
    LOC_MAP_OCCLUSION
    LOC_MAP_EMISSION
    LOC_MAP_HEIGHT
    LOC_MAP_CUBEMAP
    LOC_MAP_IRRADIANCE
    LOC_MAP_PREFILTER
    LOC_MAP_BRDF
	)))

; Shader uniform data types
(define _ShaderUniformDataType
  (_enum
	'(
    UNIFORM_FLOAT = 0
    UNIFORM_VEC2
    UNIFORM_VEC3
    UNIFORM_VEC4
    UNIFORM_INT
    UNIFORM_IVEC2
    UNIFORM_IVEC3
    UNIFORM_IVEC4
    UNIFORM_SAMPLER2D
	)))

; Pixel formats
; NOTE: Support depends on OpenGL version and platform
(define _PixelFormat
  (_enum
	'(
    UNCOMPRESSED_GRAYSCALE = 1     ; 8 bit per pixel (no alpha)
    UNCOMPRESSED_GRAY_ALPHA        ; 8*2 bpp (2 channels)
    UNCOMPRESSED_R5G6B5            ; 16 bpp
    UNCOMPRESSED_R8G8B8            ; 24 bpp
    UNCOMPRESSED_R5G5B5A1          ; 16 bpp (1 bit alpha)
    UNCOMPRESSED_R4G4B4A4          ; 16 bpp (4 bit alpha)
    UNCOMPRESSED_R8G8B8A8          ; 32 bpp
    UNCOMPRESSED_R32               ; 32 bpp (1 channel - float)
    UNCOMPRESSED_R32G32B32         ; 32*3 bpp (3 channels - float)
    UNCOMPRESSED_R32G32B32A32      ; 32*4 bpp (4 channels - float)
    COMPRESSED_DXT1_RGB            ; 4 bpp (no alpha)
    COMPRESSED_DXT1_RGBA           ; 4 bpp (1 bit alpha)
    COMPRESSED_DXT3_RGBA           ; 8 bpp
    COMPRESSED_DXT5_RGBA           ; 8 bpp
    COMPRESSED_ETC1_RGB            ; 4 bpp
    COMPRESSED_ETC2_RGB            ; 4 bpp
    COMPRESSED_ETC2_EAC_RGBA       ; 8 bpp
    COMPRESSED_PVRT_RGB            ; 4 bpp
    COMPRESSED_PVRT_RGBA           ; 4 bpp
    COMPRESSED_ASTC_4x4_RGBA       ; 8 bpp
    COMPRESSED_ASTC_8x8_RGBA        ; 2 bpp
	)))

; Texture parameters: filter mode
; NOTE 1: Filtering considers mipmaps if available in the texture
; NOTE 2: Filter is accordingly set for minification and magnification
(define _TextureFilterMode
  (_enum
	'(
    FILTER_POINT = 0               ; No filter just pixel aproximation
    FILTER_BILINEAR                ; Linear filtering
    FILTER_TRILINEAR               ; Trilinear filtering (linear with mipmaps)
    FILTER_ANISOTROPIC_4X          ; Anisotropic filtering 4x
    FILTER_ANISOTROPIC_8X          ; Anisotropic filtering 8x
    FILTER_ANISOTROPIC_16X         ; Anisotropic filtering 16x
	)))

; Texture parameters: wrap mode
(define _TextureWrapMode
  (_enum
	'(
    WRAP_REPEAT = 0        ; Repeats texture in tiled mode
    WRAP_CLAMP             ; Clamps texture to edge pixel in tiled mode
    WRAP_MIRROR_REPEAT     ; Mirrors and repeats the texture in tiled mode
    WRAP_MIRROR_CLAMP       ; Mirrors and clamps to border the texture in tiled mode
	)))

; Font type defines generation method
(define _FontType
  (_enum
	'(
    FONT_DEFAULT = 0       ; Default font generation anti-aliased
    FONT_BITMAP            ; Bitmap font generation no anti-aliasing
    FONT_SDF                ; SDF font generation requires external shader
	)))

; Color blending modes (pre-defined)
(define _BlendMode
  (_enum
	'(
    BLEND_ALPHA = 0        ; Blend textures considering alpha (default)
    BLEND_ADDITIVE         ; Blend textures adding colors
    BLEND_MULTIPLIED        ; Blend textures multiplying colors
	)))

; Type of n-patch
(define _NPatchType
  (_enum
	'(
    NPT_9PATCH = 0         ; Npatch defined by 3x3 tiles
    NPT_3PATCH_VERTICAL    ; Npatch defined by 1x3 tiles
    NPT_3PATCH_HORIZONTAL   ; Npatch defined by 3x1 tiles
	)))


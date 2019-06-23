#lang racket/base

(require ffi/unsafe
		 ffi/unsafe/define
		 "structs.rkt"
		 "enums.rkt")

(define-ffi-definer drl (ffi-lib "libraylib"))

(provide (except-out (all-defined-out) drl))

;module: core
;============

;window related functions

;void InitWindow(int width, int height, const char *title);     
;// Initialize window and OpenGL context
(drl InitWindow (_fun _int _int _string -> _void))
    
;bool WindowShouldClose(void);       
;// Check if KEY_ESCAPE pressed or Close icon pressed
(drl WindowShouldClose (_fun -> _bool))
 
;void CloseWindow(void);
;// Close window and unload OpenGL context
(drl CloseWindow (_fun -> _void))

;bool IsWindowReady(void);
;// Check if window has been initialized successfully
(drl IsWindowReady (_fun -> _bool))

;bool IsWindowMinimized(void);                                           
;// Check if window has been minimized (or lost focus)
(drl IsWindowMinimized (_fun -> _bool))

;bool IsWindowResized(void);
;// Check if window has been resized
(drl IsWindowResized (_fun -> _void))

;bool IsWindowHidden(void);
;// Check if window is currently hidden
(drl IsWindowHidden (_fun -> _void))

;void ToggleFullscreen(void);
;// Toggle fullscreen mode (only PLATFORM_DESKTOP)
(drl ToggleFullscreen (_fun -> _void))

;void UnhideWindow(void);
;// Show the window
(drl UnhideWindow (_fun -> _void))

;void HideWindow(void);
;// Hide the window
(drl HideWindow (_fun -> _void))

;void SetWindowIcon(Image image);
;// Set icon for window (only PLATFORM_DESKTOP)
(drl SetWindowIcon (_fun _Image -> _void))

;void SetWindowTitle(const char *title);
;// Set title for window (only PLATFORM_DESKTOP)
(drl SetWindowTitle (_fun _string -> _void))

;void SetWindowPosition(int x, int y);
;// Set window position on screen (only PLATFORM_DESKTOP)
(drl SetWindowPosition (_fun _int _int -> _void))

;void SetWindowMonitor(int monitor);
;// Set monitor for the current window (fullscreen mode)
(drl SetWindowMonitor (_fun _int -> _void))

;void SetWindowMinSize(int width, int height);
;// Set window minimum dimensions (for FLAG_WINDOW_RESIZABLE)
(drl SetWindowMinSize (_fun _int _int -> _void))

;void SetWindowSize(int width, int height);
;// Set window dimensions
(drl SetWindowSize (_fun _int _int -> _void))

;void *GetWindowHandle(void);
;// Get native window handle
(drl GetWindowHandle (_fun -> _pointer))

;int GetScreenWidth(void);
;// Get current screen width
(drl GetScreenWidth (_fun -> _int))

;int GetScreenHeight(void);
;// Get current screen height
(drl GetScreenHeight (_fun -> _int))

;int GetMonitorCount(void);
;// Get number of connected monitors
(drl GetMonitorCount (_fun -> _int ))

;int GetMonitorWidth(int monitor);
;// Get primary monitor width
(drl GetMonitorWidth (_fun _int -> _int))

;int GetMonitorHeight(int monitor);
;// Get primary monitor height
(drl GetMonitorHeight (_fun _int -> _int))

;int GetMonitorPhysicalWidth(int monitor);
;// Get primary monitor physical width in millimetres
(drl GetMonitorPhysicalWidth (_fun _int -> _int))

;int GetMonitorPhysicalHeight(int monitor);
;// Get primary monitor physical height in millimetres
(drl GetMonitorPhysicalHeight (_fun _int -> _int))

;const char *GetMonitorName(int monitor);
;// Get the human-readable, UTF-8 encoded name of the primary monitor
(drl GetMonitorName (_fun _int -> _string))


;Cursor-related functions

;void ShowCursor(void);
;// Shows cursor
(drl ShowCursor (_fun -> _void))

;void HideCursor(void);
;// Hides cursor
(drl HideCursor (_fun -> _void))

;bool IsCursorHidden(void);
;// Check if cursor is not visible
(drl IsCursorHidden (_fun -> _bool))

;void EnableCursor(void);
;// Enables cursor (unlock cursor)
(drl EnableCursor (_fun -> _void))

;void DisableCursor(void);
;// Disables cursor (lock cursor)
(drl DisableCursor (_fun -> _void))

;Drawing-related functions            

;void ClearBackground(Color color);
;// Set background color (framebuffer clear color)
(drl ClearBackground (_fun _Color -> _void))

;void BeginDrawing(void);
;// Setup canvas (framebuffer) to start drawing
(drl BeginDrawing (_fun -> _void))

;void EndDrawing(void);
;// End canvas drawing and swap buffers (double buffering)
(drl EndDrawing (_fun -> _void))

;void BeginMode2D(Camera2D camera);
;// Initialize 2D mode with custom camera (2D)
(drl BeginMode2D (_fun _Camera2D -> _void))

;void EndMode2D(void);
;// Ends 2D mode with custom camera
(drl EndMode2D (_fun -> _void))

;void BeginTextureMode(RenderTexture2D target);
;// Initializes render texture for drawing
(drl BeginTextureMode (_fun _RenderTexture2D -> _void))

;void EndTextureMode(void);
;// Ends drawing to render texture
(drl EndTextureMode (_fun -> _void))

;Timing-related functions         

;void SetTargetFPS(int fps);
;// Set target FPS (maximum)
(drl SetTargetFPS (_fun _int -> _void))

;int GetFPS(void);
;// Returns current FPS
(drl GetFPS (_fun -> _int))

;float GetFrameTime(void);
;// Returns time in seconds for last frame drawn
(drl GetFrameTime (_fun -> _float))

;double GetTime(void);
;// Returns elapsed time in seconds since InitWindow()
(drl GetTime (_fun -> _double))


;//------------------------------------------------------------------------------------
;// Input Handling Functions
;//------------------------------------------------------------------------------------

;// Input-related functions: keyb
	
;bool IsKeyPressed(int key);
;// Detect if a key has been pressed once
(drl IsKeyPressed (_fun _KeyboardKey -> _bool))

;bool IsKeyDown(int key);
;// Detect if a key is being pressed
(drl IsKeyDown (_fun _KeyboardKey -> _bool))

;bool IsKeyReleased(int key);
;// Detect if a key has been released once
(drl IsKeyReleased (_fun _KeyboardKey -> _bool))

;bool IsKeyUp(int key);
;// Detect if a key is NOT being pressed
(drl IsKeyUp (_fun _KeyboardKey -> _bool))

;int GetKeyPressed(void);
;// Get latest key pressed
(drl GetKeyPressed (_fun -> _int))

;void SetExitKey(int key);
;// Set a custom key to exit program (default is ESC)
(drl SetExitKey (_fun _KeyboardKey -> _void))

;Input-related functions: gamepads                

;bool IsGamepadAvailable(int gamepad);
;// Detect if a gamepad is available
(drl IsGamepadAvailable (_fun _int -> _void))

;bool IsGamepadName(int gamepad, const char *name);
;// Check gamepad name (if available)
(drl IsGamepadName (_fun _int _string -> _bool))

;const char *GetGamepadName(int gamepad);
;// Return gamepad internal name id
(drl GetGamepadName (_fun _int -> _string))

;bool IsGamepadButtonPressed(int gamepad, int button);
;// Detect if a gamepad button has been pressed once
(drl IsGamepadButtonPressed (_fun _int _int -> _bool))

;bool IsGamepadButtonDown(int gamepad, int button);
;// Detect if a gamepad button is being pressed
(drl IsGamepadButtonDown (_fun _int _int -> _bool))

;bool IsGamepadButtonReleased(int gamepad, int button);
;// Detect if a gamepad button has been released once
(drl IsGamepadButtonReleased (_fun _int _int -> _bool))

;bool IsGamepadButtonUp(int gamepad, int button);
;// Detect if a gamepad button is NOT being pressed
(drl IsGamepadButtonUp (_fun _int _int -> _bool))

;int GetGamepadButtonPressed(void);
;// Get the last gamepad button pressed
(drl GetGamepadButtonPressed (_fun -> _int))

;int GetGamepadAxisCount(int gamepad);
;// Return gamepad axis count for a gamepad
(drl GetGamepadAxisCount (_fun _int -> _int))

;float GetGamepadAxisMovement(int gamepad, int axis);
;// Return axis movement value for a gamepad axis
(drl GetGamepadAxisMovement (_fun _int _int -> _float))

;Input-related functions: mouse               
	
;bool IsMouseButtonPressed(int button);
;// Detect if a mouse button has been pressed once
(drl IsMouseButtonPressed (_fun _MouseButton -> _bool))

;bool IsMouseButtonDown(int button);
;// Detect if a mouse button is being pressed
(drl IsMouseButtonDown (_fun _MouseButton -> _bool))

;bool IsMouseButtonReleased(int button);
;// Detect if a mouse button has been released once
(drl IsMouseButtonReleased (_fun _MouseButton -> _bool))

;bool IsMouseButtonUp(int button);
;// Detect if a mouse button is NOT being pressed
(drl IsMouseButtonUp (_fun _MouseButton -> _bool))

;int GetMouseX(void);
;// Returns mouse position X
(drl GetMouseX (_fun -> _int))

;int GetMouseY(void);
;// Returns mouse position Y
(drl GetMouseY (_fun -> _int))

;Vector2 GetMousePosition(void);
;// Returns mouse position XY
(drl GetMousePosition (_fun -> _Vector2))

;void SetMousePosition(int x, int y);
;// Set mouse position XY
(drl SetMousePosition (_fun _int _int -> _void))

;void SetMouseOffset(int offsetX, int offsetY);
;// Set mouse offset
(drl SetMouseOffset (_fun _int _int -> _void))

;void SetMouseScale(float scaleX, float scaleY);
;// Set mouse scaling
(drl SetMouseScale (_fun _float _float -> _void))

;int GetMouseWheelMove(void);
;// Returns mouse wheel movement Y
(drl GetMouseWheelMove (_fun -> _int ))


;module: shapes
;==============


;Basic shapes drawing functions

;void DrawPixel(int posX, int posY, Color color);
;// Draw a pixel
(drl DrawPixel (_fun _int _int _Color -> _void))

;void DrawPixelV(Vector2 position, Color color);
;// Draw a pixel (Vector version)
(drl DrawPixelV (_fun _Vector2 _Color -> _void))

;void DrawLine(int startPosX, int startPosY, int endPosX, int endPosY, Color color);
;// Draw a line
(drl DrawLine (_fun _int _int _int _int _Color -> _void))

;void DrawLineV(Vector2 startPos, Vector2 endPos, Color color);
;// Draw a line (Vector version)
(drl DrawLineV (_fun _Vector2 _Vector2 _Color -> _void))

;void DrawLineEx(Vector2 startPos, Vector2 endPos, float thick, Color color);
;// Draw a line defining thickness
(drl DrawLineEx (_fun _Vector2 _Vector2 _float _Color -> _void))

;void DrawLineBezier(Vector2 startPos, Vector2 endPos, float thick, Color color);
;// Draw a line using cubic-bezier curves in-out
(drl DrawLineBezier (_fun _Vector2 _Vector2 _float _Color -> _void))

;void DrawLineStrip(Vector2 *points, int numPoints, Color color);         
;// Draw lines sequence
(drl DrawLineStrip
	 (_fun (points : [_list i _Vector2]) (len : _int = (length points)) _Color -> _void))

;void DrawCircle(int centerX, int centerY, float radius, Color color);
;// Draw a color-filled circle
(drl DrawCircle (_fun _int _int _float _Color -> _void))

;void DrawCircleSector(Vector2 center, float radius, int startAngle, int endAngle, int segments, Color color);
;// Draw a piece of a circle
(drl DrawCircleSector (_fun _Vector2 _float _int _int _int _Color -> _void))

;void DrawCircleSectorLines(Vector2 center, float radius, int startAngle, int endAngle, int segments, Color color);
;// Draw circle sector outline
(drl DrawCircleSectorLines (_fun _Vector2 _float _int _int _int _Color -> _void))

;void DrawCircleGradient(int centerX, int centerY, float radius, Color color1, Color color2);
;// Draw a gradient-filled circle
(drl DrawCircleGradient (_fun _int _int _float _Color _Color -> _void))

;void DrawCircleV(Vector2 center, float radius, Color color);
;// Draw a color-filled circle (Vector version)
(drl DrawCircleV (_fun _Vector2 _float _Color -> _void))

;void DrawCircleLines(int centerX, int centerY, float radius, Color color);
;// Draw circle outline
(drl DrawCircleLines (_fun _int _int _float _Color -> _void))

;void DrawRing(Vector2 center, float innerRadius, float outerRadius, int startAngle, int endAngle, int segments, Color color);
;// Draw ring
(drl DrawRing (_fun _Vector2 _float _float _int _int _int _Color -> _void))

;void DrawRingLines(Vector2 center, float innerRadius, float outerRadius, int startAngle, int endAngle, int segments, Color color);
;// Draw ring outline
(drl DrawRingLines (_fun _Vector2 _float _float _int _int _int _Color -> _void))

;void DrawRectangle(int posX, int posY, int width, int height, Color color);
;// Draw a color-filled rectangle
(drl DrawRectangle (_fun _int _int _int _int _Color -> _void))

;void DrawRectangleV(Vector2 position, Vector2 size, Color color);
;// Draw a color-filled rectangle (Vector version)
(drl DrawRectangleV (_fun _Vector2 _Vector2 _Color -> _void))

;void DrawRectangleRec(Rectangle rec, Color color);
;// Draw a color-filled rectangle
(drl DrawRectangleRec (_fun _Rectangle _Color -> _void))

;void DrawRectanglePro(Rectangle rec, Vector2 origin, float rotation, Color color);
;// Draw a color-filled rectangle with pro parameters
(drl DrawRectanglePro (_fun _Rectangle _Vector2 _float _Color -> _void))

;void DrawRectangleGradientV(int posX, int posY, int width, int height, Color color1, Color color2);
;// Draw a vertical-gradient-filled rectangle
(drl DrawRectangleGradientV (_fun _int _int _int _int _Color _Color -> _void))

;void DrawRectangleGradientH(int posX, int posY, int width, int height, Color color1, Color color2);
;// Draw a horizontal-gradient-filled rectangle
(drl DrawRectangleGradientH (_fun _int _int _int _int _Color _Color -> _void))

;void DrawRectangleGradientEx(Rectangle rec, Color col1, Color col2, Color col3, Color col4);
;// Draw a gradient-filled rectangle with custom vertex colors
(drl DrawRectangleGradientEx (_fun _Rectangle _Color _Color _Color _Color -> _void))

;void DrawRectangleLines(int posX, int posY, int width, int height, Color color);
;// Draw rectangle outline
(drl DrawRectangleLines (_fun _int _int _int _int _Color -> _void))

;void DrawRectangleLinesEx(Rectangle rec, int lineThick, Color color);
;// Draw rectangle outline with extended parameters
(drl DrawRectangleLinesEx (_fun _Rectangle _int _Color -> _void))

;void DrawRectangleRounded(Rectangle rec, float roundness, int segments, Color color);
;// Draw rectangle with rounded edges
(drl DrawRectangleRounded (_fun _Rectangle _float _int _Color -> _void))

;void DrawRectangleRoundedLines(Rectangle rec, float roundness, int segments, int lineThick, Color color);
;// Draw rectangle with rounded edges outline
(drl DrawRectangleRoundedLines (_fun _Rectangle _float _int _int _Color -> _void))

;void DrawTriangle(Vector2 v1, Vector2 v2, Vector2 v3, Color color);
;// Draw a color-filled triangle
(drl DrawTriangle (_fun _Vector2 _Vector2 _Vector2 _Color -> _void))

;void DrawTriangleLines(Vector2 v1, Vector2 v2, Vector2 v3, Color color);
;// Draw triangle outline
(drl DrawTriangleLines (_fun _Vector2 _Vector2 _Vector2 _Color -> _void))

;void DrawPoly(Vector2 center, int sides, float radius, float rotation, Color color);
;// Draw a regular polygon (Vector version)
(drl DrawPoly (_fun _Vector2 _int _float _float _Color -> _void))

;void DrawTriangleFan(Vector2 *points, int numPoints, Color color);                                 
;// Draw a triangle fan defined by points
(drl DrawTriangleFan
	 (_fun (points : [_list i _Vector2]) (len : _int = (length points)) _Color -> _void))

;void SetShapesTexture(Texture2D texture, Rectangle source);
;// Define default texture used to draw shapes
(drl SetShapesTexture (_fun _Texture2D _Rectangle -> _void))


;module: textures
;================

;Image/Texture2D data loading/unloading/saving functions

;Image LoadImage(const char *fileName);
;// Load image from file into CPU memory (RAM)
(drl LoadImage (_fun _string -> _Image))

;Image LoadImageEx(Color *pixels, int width, int height);
;// Load image from Color array data (RGBA - 32bit)
(drl LoadImageEx (_fun (_list i _Color) _int _int -> _Image))

;Image LoadImagePro(void *data, int width, int height, int format);
;// Load image from raw data with parameters
(drl LoadImagePro (_fun _pointer _int _int _int -> _Image))

;Image LoadImageRaw(const char *fileName, int width, int height, int format, int headerSize);
;// Load image from RAW file data
(drl LoadImageRaw (_fun _string _int _int _int _int -> _Image))

;void ExportImage(Image image, const char *fileName);
;// Export image data to file
(drl ExportImage (_fun _Image _string -> _void))

;void ExportImageAsCode(Image image, const char *fileName);
;// Export image as code file defining an array of bytes
(drl ExportImageAsCode (_fun _Image _string -> _void))

;Texture2D LoadTexture(const char *fileName);
;// Load texture from file into GPU memory (VRAM)
(drl LoadTexture (_fun _string -> _Texture2D))

;Texture2D LoadTextureFromImage(Image image);
;// Load texture from image data
(drl LoadTextureFromImage (_fun _Image -> _Texture2D))

;RenderTexture2D LoadRenderTexture(int width, int height);
;// Load texture for rendering (framebuffer)
(drl LoadRenderTexture (_fun _int _int -> _RenderTexture2D))

;void UnloadImage(Image image);
;// Unload image from CPU memory (RAM)
(drl UnloadImage (_fun _Image -> _void))

;void UnloadTexture(Texture2D texture);
;// Unload texture from GPU memory (VRAM)
(drl UnloadTexture (_fun _Texture2D -> _void))

;void UnloadRenderTexture(RenderTexture2D target);
;// Unload render texture from GPU memory (VRAM)
(drl UnloadRenderTexture (_fun _RenderTexture2D -> _void))

;Color *GetImageData(Image image);
;// Get pixel data from image as a Color struct array
(drl GetImageData (_fun (img : _Image) -> (_list o _Color (* (Image-width img) (* Image-height img)))))

;Vector4 *GetImageDataNormalized(Image image);
;// Get pixel data from image as Vector4 array (float normalized)
(drl GetImageDataNormalized (_fun (img : _Image) -> (_list o _Vector4 (* (Image-width img) (* Image-height img)))))

;int GetPixelDataSize(int width, int height, int format);
;// Get pixel data size in bytes (image or texture)
(drl GetPixelDataSize (_fun _int _int _int -> _int ))

;Image GetTextureData(Texture2D texture);
;// Get pixel data from GPU texture and return an Image
(drl GetTextureData (_fun _Texture -> _Image))

;Image GetScreenData(void);
;// Get pixel data from screen buffer and return an Image (screenshot)
(drl GetScreenData (_fun -> _Image))

;void UpdateTexture(Texture2D texture, const void *pixels);
;// Update GPU texture with new data
(drl UpdateTexture (_fun _Texture2D _pointer -> _void))

;Image manipulation functions                                                                     

;Image ImageCopy(Image image);
;// Create an image duplicate (useful for transformations)
(drl ImageCopy (_fun _Image -> _Image))

;void ImageToPOT(Image *image, Color fillColor);
;// Convert image to POT (power-of-two)
(drl ImageToPOT (_fun _Image-pointer _Color -> _void))

;void ImageFormat(Image *image, int newFormat);
;// Convert image data to desired format
(drl ImageFormat (_fun _Image-pointer _int -> _void))

;void ImageAlphaMask(Image *image, Image alphaMask);
;// Apply alpha mask to image
(drl ImageAlphaMask (_fun _Image-pointer _Image -> _void))

;void ImageAlphaClear(Image *image, Color color, float threshold);
;// Clear alpha channel to desired color
(drl ImageAlphaClear (_fun _Image-pointer _Color _float -> _void))

;void ImageAlphaCrop(Image *image, float threshold);
;// Crop image depending on alpha value
(drl ImageAlphaCrop (_fun _Image-pointer _float -> _void))

;void ImageAlphaPremultiply(Image *image);
;// Premultiply alpha channel
(drl ImageAlphaPremultiply (_fun _Image-pointer -> _void))

;void ImageCrop(Image *image, Rectangle crop);
;// Crop an image to a defined rectangle
(drl ImageCrop (_fun _Image-pointer _Rectangle -> _void))

;void ImageResize(Image *image, int newWidth, int newHeight);
;// Resize image (Bicubic scaling algorithm)
(drl ImageResize (_fun _Image-pointer _int _int -> _void))

;void ImageResizeNN(Image *image, int newWidth,int newHeight);
;// Resize image (Nearest-Neighbor scaling algorithm)
(drl ImageResizeNN (_fun _Image-pointer _int _int -> _void))

;void ImageResizeCanvas(Image *image, int newWidth, int newHeight, int offsetX, int offsetY, Color color);
;// Resize canvas and fill with color
(drl ImageResizeCanvas (_fun _Image-pointer _int _int _int _int _Color -> _void))

;void ImageMipmaps(Image *image);
;// Generate all mipmap levels for a provided image
(drl ImageMipmaps (_fun _Image-pointer -> _void))

;void ImageDither(Image *image, int rBpp, int gBpp, int bBpp, int aBpp);
;// Dither image data to 16bpp or lower (Floyd-Steinberg dithering)
(drl ImageDither (_fun _Image-pointer _int _int _int _int -> _void))

;Color *ImageExtractPalette(Image image, int maxPaletteSize, int *extractCount);
;// Extract color palette from image to maximum size (memory should be freed)
(drl ImageExtractPalette 
	 (_fun _Image _int (_ptr o _int) -> (_ptr o _Color)))

;Image ImageText(const char *text, int fontSize, Color color);
;// Create an image from text (default font)
(drl ImageText (_fun _string _int _Color -> _Image))

;Image ImageTextEx(Font font, const char *text, float fontSize, float spacing, Color tint);
;// Create an image from text (custom sprite font)
(drl ImageTextEx (_fun _Font _string _float _float _Color -> _Image))

;void ImageDraw(Image *dst, Image src, Rectangle srcRec, Rectangle dstRec);
;// Draw a source image within a destination image
(drl ImageDraw (_fun _Image-pointer _Image _Rectangle _Rectangle -> _void))

;void ImageDrawRectangle(Image *dst, Rectangle rec, Color color);
;// Draw rectangle within an image
(drl ImageDrawRectangle (_fun _Image-pointer _Rectangle _Color -> _void))

;void ImageDrawRectangleLines(Image *dst, Rectangle rec, int thick, Color color);
;// Draw rectangle lines within an image
(drl ImageDrawRectangleLines (_fun _Image-pointer _Rectangle _int _Color -> _void))

;void ImageDrawText(Image *dst, Vector2 position, const char *text, int fontSize, Color color);
;// Draw text (default font) within an image (destination)
(drl ImageDrawText (_fun _Image-pointer _Vector2 _string _int _Color -> _void))

;void ImageDrawTextEx(Image *dst, Vector2 position, Font font, const char *text, float fontSize, float spacing, Color color);
;// Draw text (custom sprite font) within an image (destination)
(drl ImageDrawTextEx (_fun _Image-pointer _Vector2 _Font _string _float _float _Color -> _void))

;void ImageFlipVertical(Image *image);
;// Flip image vertically
(drl ImageFlipVertical (_fun _Image-pointer -> _void))

;void ImageFlipHorizontal(Image *image);
;// Flip image horizontally
(drl ImageFlipHorizontal (_fun _Image-pointer -> _void))

;void ImageRotateCW(Image *image);
;// Rotate image clockwise 90deg
(drl ImageRotateCW (_fun _Image-pointer -> _void))

;void ImageRotateCCW(Image *image);
;// Rotate image counter-clockwise 90deg
(drl ImageRotateCCW (_fun _Image-pointer -> _void))

;void ImageColorTint(Image *image, Color color);
;// Modify image color: tint
(drl ImageColorTint (_fun _Image-pointer _Color -> _void))

;void ImageColorInvert(Image *image);
;// Modify image color: invert
(drl ImageColorInvert (_fun _Image-pointer -> _void))

;void ImageColorGrayscale(Image *image);
;// Modify image color: grayscale
(drl ImageColorGrayscale (_fun _Image-pointer -> _void))

;void ImageColorContrast(Image *image, float contrast);
;// Modify image color: contrast (-100 to 100)
(drl ImageColorContrast (_fun _Image-pointer _float -> _void))

;void ImageColorBrightness(Image *image, int brightness);
;// Modify image color: brightness (-255 to 255)
(drl ImageColorBrightness (_fun _Image-pointer _int -> _void))

;void ImageColorReplace(Image *image, Color color, Color replace);
;// Modify image color: replace color
(drl ImageColorReplace (_fun _Image-pointer _Color _Color -> _void))

                                                                                                        
;Image generation functions                                                                       

;Image GenImageColor(int width, int height, Color color);
;// Generate image: plain color
(drl GenImageColor (_fun _int _int _Color -> _Image))

;Image GenImageGradientV(int width, int height, Color top, Color bottom);
;// Generate image: vertical gradient
(drl GenImageGradientV (_fun _int _int _Color _Color -> _Image ))

;Image GenImageGradientH(int width, int height, Color left, Color right);
;// Generate image: horizontal gradient
(drl GenImageGradientH (_fun _int _int _Color _Color -> _Image))

;Image GenImageGradientRadial(int width, int height, float density, Color inner, Color outer);
;// Generate image: radial gradient
(drl GenImageGradientRadial (_fun _int _int _float _Color _Color -> _Image))

;Image GenImageChecked(int width, int height, int checksX, int checksY, Color col1, Color col2);
;// Generate image: checked
(drl GenImageChecked (_fun _int _int _int _int _Color _Color -> _Image))

;Image GenImageWhiteNoise(int width, int height, float factor);
;// Generate image: white noise
(drl GenImageWhiteNoise (_fun _int _int _float -> _Image))

;Image GenImagePerlinNoise(int width, int height, int offsetX, int offsetY, float scale);
;// Generate image: perlin noise
(drl GenImagePerlinNoise (_fun _int _int _int _int _float -> _Image))

;Image GenImageCellular(int width, int height, int tileSize);
;// Generate image: cellular algorithm. Bigger tileSize means bigger cells
(drl GenImageCellular (_fun _int _int _int -> _Image))

;Texture2D configuration functions                                                                

;void GenTextureMipmaps(Texture2D *texture);
;// Generate GPU mipmaps for a texture
(drl GenTextureMipmaps (_fun _Texture2D-pointer -> _void))

;void SetTextureFilter(Texture2D texture, int filterMode);
;// Set texture scaling filter mode
(drl SetTextureFilter (_fun _Texture2D _int -> _void))

;void SetTextureWrap(Texture2D texture, int wrapMode);
;// Set texture wrapping mode
(drl SetTextureWrap (_fun _Texture2D _int -> _void))

;Texture2D drawing functions                                                                      
	
;void DrawTexture(Texture2D texture, int posX, int posY, Color tint);
;// Draw a Texture2D
(drl DrawTexture (_fun _Texture2D _int _int _Color -> _void))

;void DrawTextureV(Texture2D texture, Vector2 position, Color tint);
;// Draw a Texture2D with position defined as Vector2
(drl DrawTextureV (_fun _Texture2D _Vector2 _Color -> _void))

;void DrawTextureEx(Texture2D texture, Vector2 position, float rotation, float scale, Color tint);
;// Draw a Texture2D with extended parameters
(drl DrawTextureEx (_fun _Texture2D _Vector2 _float _float _Color -> _void))

;void DrawTextureRec(Texture2D texture, Rectangle sourceRec, Vector2 position, Color tint);
;// Draw a part of a texture defined by a rectangle
(drl DrawTextureRec (_fun _Texture2D _Rectangle _Vector2 _Color -> _void))

;void DrawTextureQuad(Texture2D texture, Vector2 tiling, Vector2 offset, Rectangle quad, Color tint);
;// Draw texture quad with tiling and offset parameters
(drl DrawTextureQuad (_fun _Texture2D _Vector2 _Vector2 _Rectangle _Color -> _void ))

;void DrawTexturePro(Texture2D texture, Rectangle sourceRec, Rectangle destRec, Vector2 origin, float rotation, Color tint);
;// Draw a part of a texture defined by a rectangle with 'pro' parameters
(drl DrawTexturePro (_fun _Texture2D _Rectangle _Rectangle _Vector2 _float _Color -> _void))

;void DrawTextureNPatch(Texture2D texture, NPatchInfo nPatchInfo, Rectangle destRec, Vector2 origin, float rotation, Color tint);
;// Draws a texture (or part of it) that stretches or shrinks nicely
(drl DrawTextureNPatch (_fun _Texture2D _NPatchInfo _Rectangle _Vector2 _float _Color -> _void))


;module: text
;============

    ;Font loading/unloading functions

;Font GetFontDefault(void);
;// Get the default Font
(drl GetFontDefault (_fun -> _Font))

;Font LoadFont(const char *fileName);
;// Load font from file into GPU memory (VRAM)
(drl LoadFont (_fun _string -> _Font))

;Font LoadFontEx(const char *fileName, int fontSize, int *fontChars, int charsCount);
;// Load font from file with extended parameters
(drl LoadFontEx (_fun _string _int (chars : [_list i _int]) (_int = (length chars)) -> _Font))

;Font LoadFontFromImage(Image image, Color key, int firstChar);
;// Load font from Image (XNA style)
(drl LoadFontFromImage (_fun _Image _Color _int -> _Font))

;CharInfo *LoadFontData(const char *fileName, int fontSize, int *fontChars, int charsCount, int type);
;// Load font data for further use
(drl LoadFontData (_fun _string _int (chars : [_list i _int]) (_int = (length chars)) _int -> _CharInfo))

;Image GenImageFontAtlas(CharInfo *chars, int charsCount, int fontSize, int padding, int packMethod);
;// Generate image font atlas using chars info
(drl GenImageFontAtlas (_fun (chars : [_list i _CharInfo]) (_int = (length chars)) _int _int _int -> _Image))

;void UnloadFont(Font font);
;// Unload Font from GPU memory (VRAM)
(drl UnloadFont (_fun _Font -> _void))

;Text drawing functions
	
;void DrawFPS(int posX, int posY);
;// Shows current FPS
(drl DrawFPS (_fun _int _int -> _void ))

;void DrawText(const char *text, int posX, int posY, int fontSize, Color color);
;// Draw text (using default font)
(drl DrawText (_fun _string _int _int _int _Color -> _void ))

;void DrawTextEx(Font font, const char *text, Vector2 position, float fontSize, float spacing, Color tint);
;// Draw text using font and additional parameters
(drl DrawTextEx (_fun _Font _string _Vector2 _float _float _Color -> _void ))

;void DrawTextRec(Font font, const char *text, Rectangle rec, float fontSize, float spacing, bool wordWrap, Color tint);
;// Draw text using font inside rectangle limits
(drl DrawTextRec (_fun _Font _string _Rectangle _float _float _bool _Color -> _void))

;void DrawTextRecEx(Font font, const char *text, Rectangle rec, float fontSize, float spacing, bool wordWrap, Color tint, int selectStart, int selectLength, Color selectText, Color selectBack);
;// Draw text using font inside rectangle limits with support for text selection
(drl DrawTextRecEx (_fun _Font _string _Rectangle _float _float _bool _Color _int _int _Color _Color -> _void ))

;Text misc. functions

;int MeasureText(const char *text, int fontSize);
;// Measure string width for default font
(drl MeasureText (_fun _string _int -> _int))

;Vector2 MeasureTextEx(Font font, const char *text, float fontSize, float spacing);
;// Measure string size for Font
(drl MeasureTextEx (_fun _Font _string _float _float -> _Vector2))

;int GetGlyphIndex(Font font, int character);
;// Get index position for a unicode character on font
(drl GetGlyphIndex (_fun _Font _int -> _int))


;module: shaders (rlgl)
;======================


;Shader loading/unloading functions

;char *LoadText(const char *fileName);
;// Load chars array from text file
(drl LoadText (_fun _string -> _string ))

;Shader LoadShader(const char *vsFileName, const char *fsFileName);
;// Load shader from files and bind default locations
(drl LoadShader (_fun _string _string -> _Shader))

;Shader LoadShaderCode(char *vsCode, char *fsCode);
;// Load shader from code strings and bind default locations
(drl LoadShaderCode (_fun _string _string -> _Shader))

;void UnloadShader(Shader shader);
;// Unload shader from GPU memory (VRAM)
(drl UnloadShader (_fun _Shader -> _void ))

                                
;Shader GetShaderDefault(void);
;// Get default shader
(drl GetShaderDefault (_fun -> _Shader))

;Texture2D GetTextureDefault(void);
;// Get default texture
(drl GetTextureDefault (_fun -> _Texture2D))

                                
;Shader configuration functions                               

;int GetShaderLocation(Shader shader, const char *uniformName);
;// Get shader uniform location
(drl GetShaderLocation (_fun _Shader _string -> _int))

;void SetShaderValue(Shader shader, int uniformLoc, const void *value, int uniformType);
;// Set shader uniform value
(drl SetShaderValue (_fun _Shader _int _pointer _int -> _void))

;void SetShaderValueV(Shader shader, int uniformLoc, const void *value, int uniformType, int count);
;// Set shader uniform value vector
(drl SetShaderValueV (_fun _Shader _int _pointer _int _int -> _void ))

;void SetShaderValueMatrix(Shader shader, int uniformLoc, Matrix mat);
;// Set shader uniform value (matrix 4x4)
(drl SetShaderValueMatrix (_fun _Shader _int _Matrix -> _void ))

;void SetShaderValueTexture(Shader shader, int uniformLoc, Texture2D texture);
;// Set shader uniform value for texture
(drl SetShaderValueTexture (_fun _Shader _int _Texture2D -> _void))

;void SetMatrixProjection(Matrix proj);
;// Set a custom projection matrix (replaces internal projection matrix)
(drl SetMatrixProjection (_fun _Matrix -> _void ))

;void SetMatrixModelview(Matrix view);
;// Set a custom modelview matrix (replaces internal modelview matrix)
(drl SetMatrixModelview (_fun _Matrix -> _void ))

;Matrix GetMatrixModelview();
;// Get internal modelview matrix
(drl GetMatrixModelview (_fun -> _Matrix))

;Shading begin/end functions

;void BeginShaderMode(Shader shader);
;// Begin custom shader drawing
(drl BeginShaderMode (_fun _Shader -> _void ))

;void EndShaderMode(void);
;// End custom shader drawing (use default shader)
(drl EndShaderMode (_fun -> _void ))

;void BeginBlendMode(int mode);
;// Begin blending mode (alpha, additive, multiplied)
(drl BeginBlendMode (_fun _int -> _void ))

;void EndBlendMode(void);
;// End blending mode (reset to default: alpha blending)
(drl EndBlendMode (_fun -> _void ))

;void BeginScissorMode(int x, int y, int width, int height);
;// Begin scissor mode (define screen area for following drawing)
(drl BeginScissorMode (_fun _int _int _int _int -> _void ))

;void EndScissorMode(void);
;// End scissor mode
(drl EndScissorMode (_fun -> _void ))


#version 330

// Input vertex attributes (from vertex shader)
in vec2 fragTexCoord;
in vec4 fragColor;

// Input uniform values
uniform sampler2D texture0;
uniform vec4 colDiffuse;
uniform float mult;

// Output fragment color
out vec4 finalColor;

// NOTE: Add here your custom variables

void main()
{
	// Texel color fetching from texture sampler
	vec4 texelColor = texture(texture0, fragTexCoord);
	float dist = length(fragTexCoord);
	float col = dist * mult;
	float r = min(texelColor.r + col, 1);
	float g = min(texelColor.g + col, 1);
	float b = min(texelColor.b + col, 1);
	finalColor = vec4(r, g, b, 1);
}

#version 460 compatibility

in vec2 texcoord;

uniform sampler2D gcolor;

/* DRAWBUFFERS:0 */
layout(location = 0) out vec4 composite_tex;

void main() 
{
	vec3 color = texture2D(gcolor, texcoord).rgb;

	composite_tex = vec4(color, 1.0); //gcolor
}
#version 460 compatibility

in vec2 texcoord;
in vec4 glcolor;

uniform sampler2D texture;

/* DRAWBUFFERS:0 */
layout(location = 0) out vec4 out_tex;

void main() 
{
	vec4 color = texture2D(texture, texcoord) * glcolor;

	out_tex = color; //gcolor
}
#version 460 compatibility

in vec2 lmcoord;
in vec4 glcolor;

uniform sampler2D lightmap;

/* DRAWBUFFERS:0 */
layout(location = 0) out vec4 out_tex;

void main() 
{
	vec4 color = glcolor;
	color *= texture2D(lightmap, lmcoord);

	out_tex = color; //gcolor
}
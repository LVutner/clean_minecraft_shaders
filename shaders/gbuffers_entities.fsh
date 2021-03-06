#version 460 compatibility

in vec2 lmcoord;
in vec2 texcoord;
in vec4 glcolor;

uniform sampler2D lightmap;
uniform sampler2D texture;
uniform vec4 entityColor;

/* DRAWBUFFERS:0 */
layout(location = 0) out vec4 out_tex;

void main() 
{
	vec4 color = texture2D(texture, texcoord) * glcolor;
	color.rgb = mix(color.rgb, entityColor.rgb, entityColor.a);
	color *= texture2D(lightmap, lmcoord);

	out_tex = color; //gcolor
}
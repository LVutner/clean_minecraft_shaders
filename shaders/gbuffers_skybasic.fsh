#version 460 compatibility

in vec4 starData; //rgb = star color, a = flag for weather or not this pixel is a star.

uniform float viewHeight;
uniform float viewWidth;
uniform mat4 gbufferModelView;
uniform mat4 gbufferProjectionInverse;
uniform vec3 fogColor;
uniform vec3 skyColor;

float fogify(float x, float w) 
{
	return w / (x * x + w);
}

vec3 calcSkyColor(vec3 pos) 
{
	float upDot = dot(pos, gbufferModelView[1].xyz); //not much, what's up with you?
	return mix(skyColor, fogColor, fogify(max(upDot, 0.0), 0.25));
}

/* DRAWBUFFERS:0 */
layout(location = 0) out vec4 out_tex;


void main() 
{
	vec3 color;
	
	if (starData.a > 0.5) 
	{
		color = starData.rgb;
	}
	else 
	{
		vec4 pos = vec4(gl_FragCoord.xy / vec2(viewWidth, viewHeight) * 2.0 - 1.0, 1.0, 1.0);
		pos = gbufferProjectionInverse * pos;
		color = calcSkyColor(normalize(pos.xyz));
	}

	out_tex = vec4(color, 1.0); //gcolor
}
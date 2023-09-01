
// Sample WebGL 1 shader. This just outputs a red color
// to indicate WebGL 1 is in use.

#ifdef GL_FRAGMENT_PRECISION_HIGH
#define highmedp highp
#else
#define highmedp mediump
#endif

precision lowp float;

varying mediump vec2 vTex;
uniform lowp sampler2D samplerFront;
uniform mediump vec2 srcStart;
uniform mediump vec2 srcEnd;
uniform mediump vec2 srcOriginStart;
uniform mediump vec2 srcOriginEnd;
uniform mediump vec2 layoutStart;
uniform mediump vec2 layoutEnd;
uniform lowp sampler2D samplerBack;
uniform lowp sampler2D samplerDepth;
uniform mediump vec2 destStart;
uniform mediump vec2 destEnd;
uniform highmedp float seconds;
uniform mediump vec2 pixelSize;
uniform mediump float layerScale;
uniform mediump float layerAngle;
uniform mediump float devicePixelRatio;
uniform mediump float zNear;
uniform mediump float zFar;

//<-- UNIFORMS -->

void main(void)
{
	mediump float radAngle = radians(uAngle);
	mediump vec2 layoutSize = abs(vec2(layoutEnd.x-layoutStart.x,(layoutEnd.y-layoutStart.y)));
	mediump vec2 texelSize = abs(srcOriginEnd-srcOriginStart)/layoutSize;
	mediump vec2 actualWidth = uDistance * texelSize;
	mediump vec2 testPoint = vTex + vec2(cos(radAngle), sin(radAngle)) * actualWidth;
	gl_FragColor = texture2D(samplerFront, testPoint);
}

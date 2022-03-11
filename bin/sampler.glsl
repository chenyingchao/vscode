#ifndef PIN_NUM
#define PIN_NUM 0
#endif

lowp float insideBox(highp vec2 v, highp vec2 bottomLeft, highp vec2 topRight) {
  lowp vec2 s = step(bottomLeft, v) - step(topRight, v);
  return s.x * s.y;
}

#if PIN_NUM >= 1
uniform highp mat4 pin0Transform;
uniform sampler2D pin0;

lowp vec4 getPin0(highp vec4 textureCoordinate) {
  highp vec2 pos = (pin0Transform * textureCoordinate).xy;
  lowp vec4 color = texture2D(pin0, pos);
  lowp float alpha = insideBox(pos, vec2(0.), vec2(1.));

  color.a = min(color.a, alpha);
  color.r = min(color.r, alpha);
  color.g = min(color.g, alpha);
  color.b = min(color.b, alpha);
  return color;
}

lowp vec4 getPin0(highp vec2 uv) {
  return getPin0(vec4(uv, vec2(1.0)));
}
#endif

#if PIN_NUM >= 2
uniform highp mat4 pin1Transform;
uniform sampler2D pin1;

lowp vec4 getPin1(highp vec4 textureCoordinate) {
  highp vec2 pos = (pin1Transform * textureCoordinate).xy;
  lowp vec4 color = texture2D(pin1, pos);
  lowp float alpha = insideBox(pos, vec2(0.), vec2(1.));

  color.a = min(color.a, alpha);
  color.r = min(color.r, alpha);
  color.g = min(color.g, alpha);
  color.b = min(color.b, alpha);
  return color;
}

lowp vec4 getPin1(highp vec2 uv) {
  return getPin1(vec4(uv, vec2(1.0)));
}
#endif

#if PIN_NUM >= 3
uniform highp mat4 pin2Transform;
uniform sampler2D pin2;

lowp vec4 getPin2(highp vec4 textureCoordinate) {
  highp vec2 pos = (pin2Transform * textureCoordinate).xy;
  lowp vec4 color = texture2D(pin2, pos);
  lowp float alpha = insideBox(pos, vec2(0.), vec2(1.));

  color.a = min(color.a, alpha);
  color.r = min(color.r, alpha);
  color.g = min(color.g, alpha);
  color.b = min(color.b, alpha);
  return color;
}

lowp vec4 getPin2(highp vec2 uv) {
  return getPin2(vec4(uv, vec2(1.0)));
}
#endif

#if PIN_NUM >= 4
uniform highp mat4 pin3Transform;
uniform sampler2D pin3;

lowp vec4 getPin3(highp vec4 textureCoordinate) {
  highp vec2 pos = (pin3Transform * textureCoordinate).xy;
  lowp vec4 color = texture2D(pin3, pos);
  lowp float alpha = insideBox(pos, vec2(0.), vec2(1.));

  color.a = min(color.a, alpha);
  color.r = min(color.r, alpha);
  color.g = min(color.g, alpha);
  color.b = min(color.b, alpha);
  return color;
}

lowp vec4 getPin3(highp vec2 uv) {
  return getPin3(vec4(uv, vec2(1.0)));
}
#endif

#ifndef BACKGROUND_HANDLE
#define BACKGROUND_HANDLE 0
#endif

#if BACKGROUND_HANDLE > 0
uniform highp mat4 backgroundTransform;
uniform sampler2D background;

lowp vec4 getBackground(highp vec4 screenCoordinate) {
  return texture2D(background, (backgroundTransform * screenCoordinate).xy);
}

lowp vec4 getBackground(highp vec2 screenCoordinate) {
  return getBackground(vec4(screenCoordinate, vec2(1.0)));
}
#endif
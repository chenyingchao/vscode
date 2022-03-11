/**
 *  Rect(x, y, width, height) to point rect(bottomLeft, topRight).
 */
highp vec4 rectToPRect(highp vec4 rect) {
  return vec4(rect.x, rect.y, rect.x + rect.z, rect.y + rect.w);
}

/**
 *  Point rect(bottomLeft, topRight) to rect(x, y, width, height).
 */
highp vec4 pRectToRect(highp vec4 rect) {
  return vec4(rect.x, rect.y, rect.z - rect.x, rect.w - rect.y);
}

highp vec2 transformPointByRect(highp vec4 srcRect, highp vec4 destRect,
                                highp vec2 point) {
  return vec2(((point.x - srcRect.x) / srcRect.z) * destRect.z + destRect.x,
              ((point.y - srcRect.y) / srcRect.w) * destRect.w + destRect.y);
}

highp vec4 transformRectByRect(highp vec4 srcRect, highp vec4 destRect,
                               highp vec4 rect) {
  highp vec4 pRect = rectToPRect(rect);
  return pRectToRect(vec4(transformPointByRect(srcRect, destRect, pRect.xy),
                          transformPointByRect(srcRect, destRect, pRect.zw)));
}

highp vec4 putRectToRectUsingNone(highp vec4 rect, highp vec2 size) {
  return vec4(rect.x + (rect.z - size.x) / 2.0,
              rect.y + (rect.w - size.y) / 2.0, size);
}

highp vec4 putRectToRectUsingUniform(highp vec4 rect, highp vec2 size) {
  highp float scale = min(rect.z / size.x, rect.w / size.y);
  size = scale * size;

  return vec4(rect.x + (rect.z - size.x) / 2.0,
              rect.y + (rect.w - size.y) / 2.0, size);
}


highp vec4 putRectToRectUsingUniformByWidth(highp vec4 rect, highp vec2 size) {
  highp float scale = rect.z / size.x;
  size = scale * size;

  return vec4(rect.x + (rect.z - size.x) / 2.0,
              rect.y + (rect.w - size.y) / 2.0, size);
}

highp vec4 putRectToRectUsingUniformToFill(highp vec4 rect, highp vec2 size) {
  highp float scale = max(rect.z / size.x, rect.w / size.y);
  size = scale * size;

  return vec4(rect.x + (rect.z - size.x) / 2.0,
              rect.y + (rect.w - size.y) / 2.0, size);
}

highp vec4 putRectToPosition(highp vec2 size, highp vec2 pos) {
  return vec4(pos.x - size.x / 2.0, pos.y - size.y / 2.0, size);
}

highp vec4 centerRect(highp vec2 size) {
  return putRectToPosition(size, vec2(0.0));
}

highp vec4 resizeRect(highp vec4 rect, highp float scale) {
  highp vec2 newSize = rect.zw * scale;
  return vec4(rect.x + (rect.z - newSize.x) / 2.0,
              rect.y + (rect.w - newSize.y) / 2.0, newSize.x, newSize.y);
}
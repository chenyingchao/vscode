lowp vec4 blend(lowp vec4 src, lowp vec4 append) {
  return vec4(src.rgb * (1.0 - append.a) + append.rgb,
              1.0 - (1.0 - src.a) * (1.0 - append.a));
}

lowp vec3 screen(lowp vec3 s, lowp vec3 d) { return s + d - s * d; }

lowp vec4 screen(lowp vec4 s, lowp vec4 d) { return vec4(clamp(screen(s.rgb, d.rgb), 0., s.a), s.a); }

lowp vec3 lighten(lowp vec3 s, lowp vec3 d) { return max(s, d); }

lowp float hardLight(lowp float s,lowp float d )
{
	return (s < 0.5) ? 2.0 * s * d : 1.0 - 2.0 * (1.0 - s) * (1.0 - d);
}

lowp vec3 hardLight(lowp vec3 s,lowp vec3 d )
{
	lowp vec3 c;
	c.x = hardLight(s.x,d.x);
	c.y = hardLight(s.y,d.y);
	c.z = hardLight(s.z,d.z);
	return c;
}

lowp float overlay(lowp float s, lowp float d) {
  return (d < 0.5) ? 2.0 * s * d : 1.0 - 2.0 * (1.0 - s) * (1.0 - d);
}

lowp vec3 overlay(lowp vec3 s, lowp vec3 d) {
  lowp vec3 c;
  c.x = overlay(s.x, d.x);
  c.y = overlay(s.y, d.y);
  c.z = overlay(s.z, d.z);
  return c;
}

highp vec3 rgb(highp vec4 color) {
  highp float sign_value = sign(color.a);
  highp float sign_value_squared = sign_value*sign_value;
  highp float invertA =  sign_value_squared / ( color.a + sign_value_squared - 1.0);
  return color.rgb * invertA;
}
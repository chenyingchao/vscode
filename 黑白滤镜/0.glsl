// #iChannel0 "file://Users/chenyingchao/vscode/拜年/date_spec.png"
// #iChannel1 "file://Users/chenyingchao/vscode/三格/for_test.jpeg"

#iChannel0 "./拜年/cat.jpg" 
#include "./bin/rect.glsl"
#include "./bin/blend/blend.glsl"

void mainImage( out vec4 fragColor, in vec2 fragCoord ) {

    vec2 uv = fragCoord/iResolution.xy;
    vec4 currentColor = vec4(0.7333, 0.0706, 0.0706, 1.0);
    currentColor = texture(iChannel0, uv);
    fragColor = currentColor;
}
// #iChannel0 "file://Users/chenyingchao/vscode/拜年/date_spec.png"
// #iChannel1 "file://Users/chenyingchao/vscode/三格/for_test.jpeg"

#iChannel0 "./cat.jpg"
#iChannel1 "./frame.png"
#iChannel2 "./date.png"

#include "./bin/rect.glsl"
#include "./bin/blend/blend.glsl"


vec2 borderSize = vec2(1000.0, 1500.0);
vec2 dateSize = vec2(800.0, 3100.0);
vec2 imageSize = vec2(3024.0, 4032.0);


float imageLeft = 50.0;
float imageTop = 50.0;
float imageBottom = 100.0;

void mainImage( out vec4 fragColor, in vec2 fragCoord ) {

    vec2 uv = fragCoord/iResolution.xy;
    vec4 currentColor = vec4(0.7333, 0.0706, 0.0706, 1.0);
    currentColor = blend(currentColor, texture(iChannel1, uv));
   
    
    highp vec4 rect = vec4(0, 0, iResolution.xy);
    highp vec4 imageRect = vec4(imageLeft, imageBottom, iResolution.x - 2.0 * imageLeft, iResolution.y - imageTop - imageBottom);
    highp vec4 imageRect1 = putRectToRectUsingUniform(imageRect, imageSize);

    vec2 scale = imageRect1.zw/imageSize.xy;

    float scaleX = imageRect1.z/imageSize.x;
    float scaleY = imageRect1.w/imageSize.y;

    float offestX = (iResolution.x - imageRect1.z)/2.0 / iResolution.x;
    float offestY = (iResolution.y - imageRect1.w)/2.0 / iResolution.y;

     
    if(imageRect1.x<fragCoord.x && imageRect1.y < fragCoord.y && fragCoord.x<(imageRect1.x + imageRect1.z) && fragCoord.y<(imageRect1.y + imageRect1.w)) {
        //currentColor = vec4(0.5529, 0.4941, 0.4941, 1.0);
        currentColor = texture(iChannel0, vec2(uv.x*scaleX + offestX, uv.y*scaleY + offestY));
    }

    fragColor = currentColor;
}
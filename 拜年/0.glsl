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

float textLeft = 50.0;
float textBottom = 30.0;
float textWidth = 100.0;
float textHeight = 50.0;

void mainImage( out vec4 fragColor, in vec2 fragCoord ) {
 
    vec2 uv = fragCoord/iResolution.xy;

    vec4 currentColor = vec4(0.7333, 0.0706, 0.0706, 1.0);
    currentColor = blend(currentColor, texture(iChannel1, uv));
   
    
    highp vec4 rect = vec4(0, 0, iResolution.xy);
    highp vec4 rect1 = vec4(imageLeft, imageBottom, iResolution.x - 2.0 * imageLeft, iResolution.y - imageTop - imageBottom);
    highp vec4 imageRect = rect1;//putRectToRectUsingUniform(rect1, imageSize);

    float scaleX0 = imageSize.x/iResolution.x;
    float scaleY0 = imageSize.y/iResolution.y;

    float scaleX = imageSize.x / scaleX0 / imageRect.z;
    float scaleY = imageSize.y / scaleY0 / imageRect.w;

    float offestX = imageLeft / iResolution.x * scaleX;
    float offestY = imageBottom / iResolution.y * scaleY;

    vec2 uv1 = vec2(uv.x * scaleX - offestX, uv.y * scaleY - offestY);
  
    if(imageRect.x<fragCoord.x && imageRect.y < fragCoord.y && fragCoord.x<(imageRect.x + imageRect.z) && fragCoord.y<(imageRect.y + imageRect.w)) {
         currentColor = texture(iChannel0, uv1);
    }
   
    highp vec4 textRect = vec4(textLeft, textBottom, textWidth, textHeight);
    float scaleX1 = iResolution.x/dateSize.x*2.0; //图片中 一个两位数 是 100x100 像素 效果图是50x50
    float scaleY1 = iResolution.y/dateSize.y*2.0;

    float offestX1 = textLeft / iResolution.x * scaleX1;
    float offestY1 = textBottom / iResolution.y * scaleY1;
  
    vec2 uv2 = vec2(uv.x *scaleX1 - offestX1, uv.y * scaleY1 - offestY1);
   
    if(textRect.x<fragCoord.x && textRect.y < fragCoord.y && fragCoord.x<(textRect.x + textRect.z) && fragCoord.y<(textRect.y + textRect.w)) {
        currentColor = blend(currentColor, texture(iChannel2, uv2));
        //currentColor = vec4(0.7333, 0.0706, 0.0706, 1.0);
    }

    fragColor = currentColor;
}
// #iChannel0 "file://Users/chenyingchao/vscode/拜年/date_spec.png"
// #iChannel1 "file://Users/chenyingchao/vscode/三格/for_test.jpeg"

#iChannel0 "./拜年/cat.jpg" 
#iChannel1 "./黑白滤镜/2拉开对比/100.png" 
#iChannel2 "./黑白滤镜/3对比夸张/100.png" 
#iChannel3 "./黑白滤镜/4慢快门/100.png" 

#iChannel4 "./黑白滤镜/2拉开对比/0.png" 
#iChannel5 "./黑白滤镜/3对比夸张/0.png" 
#iChannel6 "./黑白滤镜/4慢快门/0.png" 

#include "./bin/rect.glsl"
#include "./bin/blend/blend.glsl"

void mainImage( out vec4 fragColor, in vec2 fragCoord ) {

    vec2 uv = fragCoord/iResolution.xy;
    vec4 currentColor = texture(iChannel0, uv);

    //找格子

    float b = currentColor.b * 63.0;//0---63 （25.5）
    vec2 index0;//（3行 1列）
    index0.y = floor(floor(b) / 8.0); //(3行)
    index0.x = floor(b) - (index0.y * 8.0); //(1列)
    
    vec2 index1;//（3行 2列）
    index1.y = floor(ceil(b) / 8.0);  //3行
    index1.x = ceil(b) - (index1.y * 8.0); //(2列)

    //转换坐标 找到位置
    vec2 texPos1;
    texPos1.x = (index0.x / 8.) + (currentColor.r / 8.);
    texPos1.y = 1. - ((index0.y * 0.125) + (63.0/512.0 * currentColor.g));

    vec2 texPos2;
    texPos2.x = (index1.x * 0.125) + (63.0/512.0 * currentColor.r);
    texPos2.y = 1. - ((index1.y * 0.125) + (63.0/512.0 * currentColor.g));

    //取色 lut0
    vec4 newColor1 = texture(iChannel3, texPos1);
    vec4 newColor2 = texture(iChannel3, texPos2);
    vec4 newColor5 = mix(newColor1, newColor2, fract(b));
   
    //lut1
    vec4 newColor3 = texture(iChannel6, texPos1);
    vec4 newColor4 = texture(iChannel6, texPos2);
    vec4 newColor6 = mix(newColor3, newColor4, fract(b));

    float s = mod(iGlobalTime, 10.0)/10.0;
    vec4 newColor100 = mix(newColor5, newColor6, s);
     
    fragColor = newColor100;
}
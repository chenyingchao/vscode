#iChannel0 "file://Users/chenyingchao/vscode/拜年/date_spec.png"

#iChannel1 "file://Users/chenyingchao/vscode/三格/for_test.jpeg"

void mainImage( out vec4 fragColor, in vec2 fragCoord )
{
    // Normalized pixel coordinates (from 0 to 1)
    vec2 uv = fragCoord/iResolution.xy;

    vec3 bgColor = vec3(0.8588, 0.0706, 0.2314);
    vec3 currentColor = bgColor;
   
    float inset_top = 30.0;
    float inset_left = 10.0;          
    float inset_bottom = 30.0;
    float inset_right = 10.0;

    float inset_top1 = 60.0;
    float inset_left1 = 30.0;          
    float inset_bottom1 = 60.0;
    float inset_right1 = 30.0;

    if ((fragCoord.x > inset_left && fragCoord.x < iResolution.x - inset_left) && (fragCoord.y > inset_top && fragCoord.y < iResolution.y - inset_bottom)) {
       currentColor = vec3(1, 1, 1);
    }

    vec3 imageColor = texture(iChannel1, vec2(uv.x, uv.y)).rgb;

    if ((fragCoord.x > inset_left1 && fragCoord.x < iResolution.x - inset_left1) && (fragCoord.y > inset_top1 && fragCoord.y < iResolution.y - inset_bottom1)) {
       currentColor = imageColor;
    }

    

    fragColor = vec4(currentColor, 1.0);
}
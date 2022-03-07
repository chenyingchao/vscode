// #iChannel0 "file://Users/chenyingchao/vscode/拜年/date_spec.png"
// #iChannel1 "file://Users/chenyingchao/vscode/三格/for_test.jpeg"

#iChannel0 "./date_spec.png"
//#iChannel1 "./filter-calendar_spec.png"
#iChannel1 "./123.JPEG.webp"

void mainImage( out vec4 fragColor, in vec2 fragCoord )
{
    // Normalized pixel coordinates (from 0 to 1)
    vec2 uv = fragCoord/iResolution.xy;
    vec3 currentColor = vec3(0.0, 0.0, 0.0);
    vec3 tagColor = texture(iChannel0, vec2(uv.x, uv.y)).rgb;
    if(fragCoord.x <50.0) {
        if(fragCoord.y > 210.0 && fragCoord.y < 230.0){
           currentColor = tagColor;
        }
    }

    fragColor = vec4(currentColor, 0.0);
}
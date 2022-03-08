// #iChannel0 "file://Users/chenyingchao/vscode/拜年/date_spec.png"
// #iChannel1 "file://Users/chenyingchao/vscode/三格/for_test.jpeg"

//#iChannel0 "./0.glsl"
//#iChannel1 "./filter-calendar_spec.png"
#iChannel1 "./123.JPEG.webp"
#iChannel0 "./date_spec.png"

const vec2 TextureSize = vec2(800.0, 3139.0);

float maxSide (vec2 size) {
   if(size.x > size.y) {
      return size.x;
   }
   return size.y;
}

vec4 cutoffColor(vec2 fragCoord) {

 // Normalized pixel coordinates (from 0 to 1)
    vec2 uv = fragCoord/iResolution.xy;
    vec4 currentColor = vec4(0.0, 0.0, 0.0, 0.0);
    vec4 tagColor = vec4(texture(iChannel0, vec2(uv.x, uv.y)).rgb, 0.0);
    if(fragCoord.x < 50.0) {
        if(fragCoord.y > 210.0 && fragCoord.y < 230.0){
           currentColor = tagColor;
        }
    }

    return currentColor;
}

void mainImage( out vec4 fragColor, in vec2 fragCoord )
{
    // Normalized pixel coordinates (from 0 to 1)
    vec2 uv = fragCoord/iResolution.xy;

    vec4 bgColor = vec4(0.8588, 0.0706, 0.2314, 1.0);
    vec4 currentColor = bgColor;
   
    float inset_top = 30.0;
    float inset_left = 10.0;          
    float inset_bottom = 30.0;
    float inset_right = 10.0;

    float inset_top1 = 100.0;
    float inset_left1 = 50.0;          
    float inset_bottom1 = 100.0;
    float inset_right1 = 50.0;

    if ((fragCoord.x > inset_left && fragCoord.x < iResolution.x - inset_left) && (fragCoord.y > inset_top && fragCoord.y < iResolution.y - inset_bottom)) {
       currentColor = vec4(1, 1, 1, 1);
    }

    vec4 imageColor = vec4(texture(iChannel1, vec2(uv.x, uv.y)).rgb, 1.0);
   

    if ((fragCoord.x > inset_left1 && fragCoord.x < iResolution.x - inset_left1) && (fragCoord.y > inset_top1 && fragCoord.y < iResolution.y - inset_bottom1)) {
       currentColor = imageColor;
    }
           
      float maxScale = maxSide(TextureSize);  

      float maxScale1 = maxSide(vec2(iResolution.x, iResolution.y));

      float scale = maxScale / maxScale1;

      if(fragCoord.x > 100.0 && fragCoord.x < 150.0 && fragCoord.y > 50.0 && fragCoord.y < 100.0) {
           
            //x: 0----50   y:210----230    
            //x: 100---150 y:50---100
            float s = iResolution.x/TextureSize.x;
            float s1 = iResolution.y/TextureSize.y;
            float x = fragCoord.x - 100.0 * s;//fragCoord.x * s;
            float y = fragCoord.y + 160.0 / s1;  //fragCoord.y / s1;
            vec2 uv1 = vec2(x, y)/TextureSize.xy;
            vec4 tagColor = vec4(texture(iChannel0, vec2(uv1.x, uv1.y)).rgb, 0.0);
            currentColor = tagColor;

      }

      // vec4 cutoffColor = cutoffColor(fragCoord);
      // if(fragCoord.x <50.0) {
      //   if(fragCoord.y > 210.0 && fragCoord.y < 230.0){
      //      currentColor = cutoffColor;
      //   }
      // }
      

    fragColor = currentColor;
}
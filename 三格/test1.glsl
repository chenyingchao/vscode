

#iChannel0 "./for_test.jpeg"

void mainImage( out vec4 fragColor, in vec2 fragCoord )
{
    // Normalized pixel coordinates (from 0 to 1)
    vec2 uv = fragCoord/iResolution.xy;
    vec2 step = 1.0 / iResolution.xy;
    

    float top = 5.0;
    float bottom = 5.0;
  vec3 currentColor;
    
    if(fragCoord.y > (iResolution.y/3.0 - top) && fragCoord.y < (iResolution.y/3.0 + top)){
       currentColor = vec3(0, 0, 0);
    } else if(fragCoord.y > (iResolution.y/3.0*2.0 - top) && fragCoord.y < (iResolution.y/3.0*2.0 + top)){
       currentColor = vec3(0, 0, 0);
    } else {
        //自上到小2，1，0
        float x = 2.0;
        float y = 1.0;
        float z = 0.0;
        
        float x1 = 1.0;
        float y1 = 0.0;
        float z1 = 2.0;
        
        x1 = 0.0;
        y1 = 1.0;
        z1 = 2.0;
        
        
        //vec3 list = vec3(2.0, 1.0, 0.0); //正常显示
         
        // vec3 list1 = vec3(0.0, 1.0, 2.0); //上下换位
        // vec3 list1 = vec3(1.0, 0.0, 2.0);
        
        float boundary = 1.0/3.0;//分界线
       
       
       
        if(uv.y > boundary * 2.0) {  //上
           //顶部，不变+0，显示中间-1，显示底部-2
           float s = x1 - x;
           //float currentRectY = uv.y -  boundary * 2.0; //当前小方格内的位置
           currentColor = texture( iChannel0, vec2(uv.x, uv.y + boundary*s)).rgb;
        } else if (uv.y < boundary) { //下
           float s = z1 - z;
           currentColor = texture( iChannel0, vec2(uv.x,  uv.y + boundary*s)).rgb;
        
        } else { //中
           float s = y1 - y;
           currentColor = texture( iChannel0, vec2(uv.x,  uv.y + boundary*s)).rgb;
        }
  
    }
   

    // Output to screen
    fragColor = vec4(currentColor, 1.0);
}
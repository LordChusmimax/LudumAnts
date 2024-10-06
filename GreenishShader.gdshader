shader_type canvas_item;

void fragment() {
    vec4 tex_color = texture(TEXTURE, UV);
    
    // Reduce red and blue channels more and enhance the green even further
    tex_color.r *= 0.2;  // Reduce red more
    tex_color.g *= 2.0;  // Enhance green more
    tex_color.b *= 0.2;  // Reduce blue more
	tex_color.a *= 0.7;
    
    COLOR = tex_color;
}

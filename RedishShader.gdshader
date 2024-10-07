shader_type canvas_item;

void fragment() {
    vec4 tex_color = texture(TEXTURE, UV);

    // Enhance red and reduce green and blue
    tex_color.r *= 1.0;  // Enhance red
    tex_color.g *= 0.0;  // Reduce green
    tex_color.b *= 0.0;  // Reduce blue
	tex_color.a *= 0.7;

    COLOR = tex_color;
}

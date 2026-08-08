shader_type canvas_item;

uniform float speed = 0.1;

void fragment() {
	vec2 uv = UV;
	
	uv.y -= TIME * speed;
	uv.x = uv.x * 2.0;
	
	vec4 tex = texture(TEXTURE, uv);
	
	COLOR = tex;
}

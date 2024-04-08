shader_type canvas_item;
render_mode blend_mix;

uniform sampler2D screen_tex_frg_5 : hint_screen_texture;


// TurnGameBoyPalette
vec3 _gameboyPaletteFunc(vec3 _col_gbp0, float _gamma_gbp0){
	_col_gbp0 = pow(_col_gbp0, vec3(_gamma_gbp0));
	// 0.83, 0.69, 0.85
	float _gray_col_gbp0 = 0.83 * _col_gbp0.r + 0.69 * _col_gbp0.g + 0.85 * _col_gbp0.b;
	vec3 _res_col_gbp0 = vec3(0.0);
	
	if      (_gray_col_gbp0 <= 1.0/4.0)
		_res_col_gbp0 = vec3(0.83, 0.69, 0.85);
	else if (_gray_col_gbp0 <= 2.0/4.0)
		_res_col_gbp0 = vec3(0.72, 0.58, 0.74);
	else if (_gray_col_gbp0 <= 3.0/4.0)
		_res_col_gbp0 = vec3(0.62, 0.48, 0.64);
	else if (_gray_col_gbp0 <= 4.0/4.0)
		_res_col_gbp0 = vec3(0.51, 0.38, 0.53);
	
	return _res_col_gbp0;
}

void fragment() {
// Input:4
	vec2 n_out4p0 = SCREEN_UV;


	vec4 n_out5p0;
// Texture2D:5
	n_out5p0 = texture(screen_tex_frg_5, n_out4p0);


	vec3 n_out9p0;
// TurnGameBoyPalette:9
	float n_in9p1 = 1.50000;
	{
		n_out9p0 = _gameboyPaletteFunc(vec3(n_out5p0.xyz), n_in9p1);
	}


// Output:0
	COLOR.rgb = n_out9p0;


}
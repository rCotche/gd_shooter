shader_type canvas_item;

//permet d'expose la variable à godot, donc avoir dans un script ou inspector
// vec3 color type et nom de ma variable
//color: source_color indique a godot que ce n'est pas just un simple vec3
//mais une couleur exprimé avec un vec3
uniform vec3 color: source_color = vec3(1);
uniform float progress: hint_range(0.0, 1.0, 0.1) = 0;

void fragment() {
	//float test_var = 0.1;
	//COLOR = vec4(0,1,1,1);
	//UV donne la current position d'un pixel
	
	//TEXTURE
	
	//current alpha value du pixel que je regarde
	float current_a = texture(TEXTURE, UV).a;
	//mix() = melange 2 couleur
	//vec3(1) = vec3(1,1,1)
	//mix(couleurA, couleurB, 1.0) full couleurB
	//mix(couleurA, couleurB, 0.0) full couleurA
	//mix(couleurA, couleurB, 0.5) un peu des 2
	//couleurA et couleurB c'est des vec4, RGBA
	vec4 target_color = mix(texture(TEXTURE, UV), vec4(color, current_a), progress);
	COLOR = target_color;
}

//void light() {
	// Called for every pixel for every light affecting the CanvasItem.
	// Uncomment to replace the default light processing function with this one.
//}

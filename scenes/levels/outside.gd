extends LevelParent

func _on_gate_player_entered_gate(_body: Variant) -> void:
	#create a tween object
	var tween = create_tween()
	#do the animation
	tween.tween_property($Player, "speed", 0, 0.5)
	#change the scene
	#get_tree().change_scene_to_file("res://scenes/levels/inside.tscn")
	TransitionLayer.change_scene("res://scenes/levels/inside.tscn")


func _on_house_player_entered() -> void:
	#create a tween object
	var tween = get_tree().create_tween()
	#run les animation tween simultanement
	#tween.set_parallel(true)
	#do the animation
	#.set_trans(Tween.TRANS_QUAD) changer la transition pour l'animation
	tween.tween_property($Player/Camera2D, "zoom", Vector2(1,1), 1).set_trans(Tween.TRANS_QUAD)
	#modulate : gere la couleur des nodes
	#la property modulate a 4 valeurs : RGBA
	#modulate:a : cible que la valeur aplha de la property
	#tween.tween_property($Player, "modulate:a", 0, 2)
	#from: Sets a custom initial value
	#tween.tween_property($Player, "modulate:a", 0, 2).from(0.5)

func _on_house_player_exited() -> void:
	#create a tween object
	var tween = get_tree().create_tween()
	#do the animation
	tween.tween_property($Player/Camera2D, "zoom", Vector2(0.6,0.6), 1)
	#tween.tween_property($Player, "modulate:a", 1, 2)

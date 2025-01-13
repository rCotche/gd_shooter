extends LevelParent

func _on_area_2d_body_entered(_body: Node2D) -> void:
	#create a tween object
	var tween = create_tween()
	#do the animation
	tween.tween_property($Player, "speed", 0, 0.5)

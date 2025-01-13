extends LevelParent

func _on_gate_player_entered_gate(_body: Variant) -> void:
	#create a tween object
	var tween = create_tween()
	#do the animation
	tween.tween_property($Player, "speed", 0, 0.5)

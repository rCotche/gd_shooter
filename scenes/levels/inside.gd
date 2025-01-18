extends LevelParent

#var outer_level_scene: PackedScene = preload("res://scenes/levels/outside.tscn")
#@export var outer_level_scene: PackedScene

func _on_area_2d_body_entered(_body: Node2D) -> void:
	#create a tween object
	var tween = create_tween()
	#do the animation
	tween.tween_property($Player, "speed", 0, 0.5)
	#get_tree().change_scene_to_file("res://scenes/levels/outside.tscn")
	#get_tree().change_scene_to_packed(outer_level_scene)
	TransitionLayer.change_scene("res://scenes/levels/outside.tscn")

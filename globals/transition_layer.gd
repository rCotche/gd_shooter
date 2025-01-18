extends CanvasLayer

func change_scene(target: String):
	$AnimationPlayer.play("fade_to_black")
	#await events
	await $AnimationPlayer.animation_finished
	get_tree().change_scene_to_file(target)
	#$AnimationPlayer.play("fade_from_black")
	$AnimationPlayer.play_backwards("fade_to_black")

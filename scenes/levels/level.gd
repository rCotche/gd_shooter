extends Node2D

#step 1 to instantiate: preload scene
var laser_scene: PackedScene = preload("res://scenes/projectiles/laser.tscn")
var grenade_scene: PackedScene = preload("res://scenes/projectiles/grenade.tscn")

func _on_gate_player_entered_gate(_body) -> void:
	#create a tween object
	var tween = create_tween()
	#do the animation
	tween.tween_property($Player, "speed", 0, 0.5)


func _on_player_laser(pos, direction) -> void:
	#step 2 to instantiate: use the method instantiate()
	var laser = laser_scene.instantiate() as Area2D
	#add our instantiate scen in the node tree
	
	#1. update the laser position
	laser.position = pos
	#2. we have to move the laser
	#check laser.gd
	laser.rotation_degrees = rad_to_deg(direction.angle()) + 90
	#laser.rotation= direction.angle()
	laser.direction = direction
	#3. i want to add the laser instance to a node2d
	$Projectiles.add_child(laser)


func _on_player_grenade(pos, direction) -> void:
	var grenade = grenade_scene.instantiate() as RigidBody2D
	grenade.position = pos
	grenade.linear_velocity = direction * grenade.speed
	$Projectiles.add_child(grenade)


func _on_house_player_entered() -> void:
	#create a tween object
	var tween = get_tree().create_tween()
	#run les animation tween simultanement
	tween.set_parallel(true)
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
	tween.tween_property($Player, "modulate:a", 1, 2)

extends Node2D

#step 1 to instantiate: preload scene
var laser_scene: PackedScene = preload("res://scenes/projectiles/laser.tscn")
var grenade_scene: PackedScene = preload("res://scenes/projectiles/grenade.tscn")

func _on_gate_player_entered_gate(body) -> void:
	print("player has entered gate")
	print(body)


func _on_player_laser(pos) -> void:
	#step 2 to instantiate: use the method instantiate()
	var laser = laser_scene.instantiate()
	#add our instantiate scen in the node tree
	
	#1. update the laser position
	laser.position = pos
	#2. we have to move the laser
	#check laser.gd
	#3. i want to add the laser instance to a node2d
	$Projectiles.add_child(laser)


func _on_player_grenade(pos) -> void:
	var grenade = grenade_scene.instantiate()
	grenade.position = pos
	$Projectiles.add_child(grenade)

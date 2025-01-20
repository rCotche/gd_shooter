extends Node2D
class_name LevelParent

#step 1 to instantiate: preload scene
var laser_scene: PackedScene = preload("res://scenes/projectiles/laser.tscn")
var grenade_scene: PackedScene = preload("res://scenes/projectiles/grenade.tscn")
var item_scene: PackedScene = preload("res://scenes/items/item.tscn")

func _ready() -> void:
	#le groupe "Container" a tous les node (box, toilet)
	#get tous les intances de node qui est dans le groupe (box, box2,
	#toilet)
	for container in get_tree().get_nodes_in_group("Container"):
		container.connect("open", _on_container_opened)

func _on_container_opened(pos, direction):
	var item = item_scene.instantiate()
	item.position = pos
	item.direction = direction
	# Use call_deferred() or set_deferred() to change monitoring state instead.
	#to solve this error we use the method call_deferred
	$Items.call_deferred("add_child", item)

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

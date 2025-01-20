extends Node

signal stat_change

var laser_amount := 20:
	get:
		return laser_amount
	set(value):
		laser_amount = value
		stat_change.emit()
var grenade_amount := 5:
	get:
		return grenade_amount
	set(value):
		grenade_amount = value
		stat_change.emit()
#SetGet attaching two function to a variable
var health := 60:
	#what happens when you reading this variable
	#NEED a return value
	get:
		return health
	#what happens when you updating this variable
	set(value):
		health = value
		stat_change.emit()

var player_pos: Vector2

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

var player_vulnerable: bool = true
#SetGet attaching two function to a variable
var health := 60:
	#what happens when you reading this variable
	#NEED a return value
	get:
		return health
	#what happens when you updating this variable
	#value is the new result of health
	set(value):
		if value > health:
			#min(,) = retoune la valeur minimum
			#donc set health at max value 100, implicitement
			health = min(value, 100)
		else:
			if player_vulnerable:
				health = value
				player_vulnerable = false
				player_invulnerable_timer()
		stat_change.emit()

var player_pos: Vector2

func player_invulnerable_timer():
	#get_tree().create_timer(0.5) = create timer in script
	await get_tree().create_timer(0.5).timeout
	player_vulnerable = true

extends CharacterBody2D

var can_laser: bool = true
var can_grenade: bool = true

signal laser(pos, direction)
signal grenade(pos, direction)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#pour dire que on utilise delta à godot on ajoute un underscore pour le prevenir
func _process(_delta: float) -> void:
	var direction = Input.get_vector("left", "right", "up", "down")
	#print(direction)
	#position += direction * 500 * delta #pas supposé faire ça avec un CharacterBody2D
	
	#velocity propriete de CharacterBody2D
	#velocity include delta automatically
	velocity = direction * 500
	#specific method to move a CharacterBody2D
	move_and_slide()
	
	#rotate
	#look_at : rotate vers un vector2
	look_at(get_global_mouse_position())
	
	#to get la direction entre le player et le mouse
	#on va soustraire les 2 vecteurs
	#mouse vecteur - player vecteur
	#cible - origine
	#permet d'obtenir la direction
	#.normalized() sans être influencer par la longeur du vecteur
	var player_direction = (get_global_mouse_position() - position).normalized()
	
	#LASER shooting input
	if Input.is_action_pressed("primary action") and can_laser:
		# randomly selected a marker 2d for the laser start
		var laser_markers = $LaserStartPositions.get_children()
		#print(laser_markers)
		#randi()           # Returns random integer between 0 and 2^32 - 1
		#randi() % 20      # Returns random integer between 0 and 19
		#randi() % 100     # Returns random integer between 0 and 99
		#randi() % 100 + 1 # Returns random integer between 1 and 100
		var laser_selected = laser_markers[randi() % laser_markers.size()]
		print(laser_selected)
		can_laser = false
		$TimerLaser.start()
		#emit the position we selected
		laser.emit(laser_selected.global_position, player_direction)
	#GRENADE shooting input
	if Input.is_action_pressed("secondary action") and can_grenade:
		#var grenade_marker = $GrenadeStartPosition.global_position #moi
		var pos = $LaserStartPositions.get_children()[0].global_position
		can_grenade = false
		$TimerGrenade.start()
		#emit the position we selected
		#grenade.emit(grenade_marker)#moi
		grenade.emit(pos, player_direction)


func _on_timer_laser_timeout() -> void:
	can_laser = true

func _on_timer_grenade_timeout() -> void:
	can_grenade = true

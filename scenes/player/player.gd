extends CharacterBody2D

var can_laser: bool = true
var can_grenade: bool = true

signal laser
signal grenade

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
	
	#laser shooting input
	if Input.is_action_pressed("primary action") and can_laser:
		#print("shoot laser")
		can_laser = false
		$TimerLaser.start()
		laser.emit()
	#grenade shooting input
	if Input.is_action_pressed("secondary action") and can_grenade:
		#print("shoot grenade")
		can_grenade = false
		$TimerGrenade.start()
		grenade.emit()


func _on_timer_laser_timeout() -> void:
	can_laser = true

func _on_timer_grenade_timeout() -> void:
	can_grenade = true

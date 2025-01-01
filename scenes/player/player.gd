extends CharacterBody2D


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
	if Input.is_action_pressed("primary action"):
		print("shoot laser")
	#grenade shooting input
	if Input.is_action_pressed("secondary action"):
		print("shoot grenade")

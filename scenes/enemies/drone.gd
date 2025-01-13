extends CharacterBody2D

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	#position.x += 200 * delta#moi
	
	#direction
	var direction := Vector2.RIGHT# Vector2(1,0)
	#velocity
	velocity  = direction * 100
	#move and slide
	move_and_slide()
func hit():
	print("damage")

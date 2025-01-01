extends CharacterBody2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	position = Vector2(200, 200)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	#position.x += 200 * delta#moi
	
	#direction
	var direction := Vector2.RIGHT# Vector2(1,0)
	#velocity
	velocity  = direction * 400
	#move and slide
	move_and_slide()

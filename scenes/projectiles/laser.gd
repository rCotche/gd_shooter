extends Area2D

#var speed: int = 1000
#@export exposes the variable to the inspector
@export var speed: int = 1000
var direction: Vector2 = Vector2.UP

func _ready() -> void:
	$SelfDestructTimer.start()

func _process(delta: float) -> void:
	position += direction * speed * delta


func _on_body_entered(body: Node2D) -> void:
	#if body.has_method("hit"):
		#body.hit()
	#with this syntax i can check a property or method
	if "hit" in body:
		body.hit()
	queue_free()


func _on_timer_timeout() -> void:
	queue_free()

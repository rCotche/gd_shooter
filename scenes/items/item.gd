extends Area2D

var rotation_speed: int = 5
var available_options := ['laser', 'laser','laser','laser','grenade', 'health']
var type = available_options[randi()%len(available_options)] 

func _ready() -> void:
	if type == 'laser':
		$Sprite2D.modulate = Color(0.4, 0.4, 0.8)
	if type == 'grenade':
		$Sprite2D.modulate = Color(0.8, 0.4, 0.4)
	if type == 'health':
		$Sprite2D.modulate = Color(0.4, 0.8, 0.4)

func _process(delta: float) -> void:
	rotation += rotation_speed * delta


func _on_body_entered(body: Node2D) -> void:
	body.add_item(type)
	queue_free()

extends Area2D

var rotation_speed: int = 5
var available_options := ['laser', 'laser','laser','laser','grenade', 'health']
var type = available_options[randi()%len(available_options)]

var direction: Vector2
var distance: int = randi_range(150,250)

func _ready() -> void:
	if type == 'laser':
		$Sprite2D.modulate = Color(0.4, 0.4, 0.8)
	if type == 'grenade':
		$Sprite2D.modulate = Color(0.8, 0.4, 0.4)
	if type == 'health':
		$Sprite2D.modulate = Color(0.4, 0.8, 0.4)
	#tweens
	
	#movement pour faire sortir du container
	var target_pos = position + direction * distance
	var tween = create_tween()
	#self equivalent de this
	tween.set_parallel(true)
	tween.tween_property(self, "position", target_pos, 0.5)
	tween.tween_property(self, "scale", Vector2(1,1), 0.3).from(Vector2(0,0))

func _process(delta: float) -> void:
	rotation += rotation_speed * delta


func _on_body_entered(_body: Node2D) -> void:
	if type == 'laser':
		Globals.laser_amount += 5
	if type == 'grenade':
		Globals.grenade_amount += 1
	if type == 'health':
		Globals.health += 10
	queue_free()

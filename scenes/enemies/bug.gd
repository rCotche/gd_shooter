extends CharacterBody2D

var player_nearby: bool = false
var player_close: bool = false
var can_attack: bool = true

var health: int = 30
var damageable: bool = true

func hit():
	if damageable:
		health -= 10
		damageable = false
		$VulnerabilityTimer.start()
		$AnimatedSprite2D.material.set_shader_parameter("progress", 1)
	if health <= 0:
		queue_free()


func _on_notice_area_2d_body_entered(body: Node2D) -> void:
	player_nearby = true


func _on_attack_area_2d_body_entered(body: Node2D) -> void:
	player_close = true


func _on_vulnerability_timer_timeout() -> void:
	damageable = true


func _on_notice_area_2d_body_exited(body: Node2D) -> void:
	player_nearby = false


func _on_attack_area_2d_body_exited(body: Node2D) -> void:
	player_close = false

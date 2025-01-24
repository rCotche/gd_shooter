extends CharacterBody2D

var player_nearby: bool = false
var can_laser: bool = true
var first_gun_shoted: bool = false

var health: int = 30
var damageable: bool = true

signal laser(pos, direction)

func hit():
	if damageable:
		health -= 10
		damageable = false
		$Timers/DamageCooldown.start()
	if health <= 0:
		queue_free()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	var pos: Vector2
	var direction: Vector2
	if player_nearby:
		look_at(Globals.player_pos)
		if can_laser:
			#if first_gun_shoted:
				#pos = $LaserSpawnPositions/Marker2D2.global_position
				#first_gun_shoted = false
			#else:
				#pos = $LaserSpawnPositions/Marker2D.global_position
				#first_gun_shoted = true
			var marker_node = $LaserSpawnPositions.get_child(first_gun_shoted)
			first_gun_shoted = not first_gun_shoted
			pos = marker_node.global_position
			direction = (Globals.player_pos - position).normalized()
			laser.emit(pos, direction)
			can_laser = false
			$Timers/LaserCooldown.start()


func _on_attack_area_body_entered(_body: Node2D) -> void:
	player_nearby = true


func _on_attack_area_body_exited(_body: Node2D) -> void:
	player_nearby = false


func _on_laser_cooldown_timeout() -> void:
	can_laser = true


func _on_damage_cooldown_timeout() -> void:
	damageable = true

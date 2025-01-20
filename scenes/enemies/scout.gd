extends CharacterBody2D

var player_nearby: bool = false
var can_laser: bool = true
var first_gun_shoted: bool = false

signal laser(pos, direction)
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


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
			$LaserCooldown.start()


func _on_attack_area_body_entered(_body: Node2D) -> void:
	player_nearby = true


func _on_attack_area_body_exited(_body: Node2D) -> void:
	player_nearby = false


func _on_laser_cooldown_timeout() -> void:
	can_laser = true

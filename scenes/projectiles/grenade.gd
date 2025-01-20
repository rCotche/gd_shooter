extends RigidBody2D

const speed = 750
var explosion_active: bool = false

var entities = []
var containers = []

#var speed: int = 1000
#@export exposes the variable to the inspector
#@export var speed: int = 1000
#var direction: Vector2 = Vector2.UP

#func _process(delta: float) -> void:
	#position += direction * speed * delta

func explode():
	$AnimationPlayer.play("Explosion")
	explosion_active = true

func _process(delta: float) -> void:
	if explosion_active:
		print("explode")

func _on_animation_player_animation_started(anim_name: StringName) -> void:
	var explodable = []
	#player & scouts
	for entity in get_tree().get_nodes_in_group("Entity"):
		entities.append(entity)
	#objects
	for container in get_tree().get_nodes_in_group("Container"):
		containers.append(container)
	#add all
	explodable = entities + containers


func _on_grenade_blast_body_entered(body: Node2D) -> void:
	pass

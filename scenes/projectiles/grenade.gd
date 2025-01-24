extends RigidBody2D

const speed = 750
var explosion_active: bool = false
var explosion_radius = 400

#var entities = []
#var containers = []

#var speed: int = 1000
#@export exposes the variable to the inspector
#@export var speed: int = 1000
#var direction: Vector2 = Vector2.UP

#func _process(delta: float) -> void:
	#position += direction * speed * delta

func explode():
	$AnimationPlayer.play("Explosion")
	explosion_active = true

func _process(_delta: float) -> void:
	if explosion_active:
		#get all
		var targets = get_tree().get_nodes_in_group("Container") + get_tree().get_nodes_in_group("Entity")
		#get throught
		for target in targets:
			#target.global_position = item ou enemie
			#distance_to(global_position) = la distance par rapport à la grenade
			#make in_range a bool avec < explosion_radius, implicitement
			var in_range = target.global_position.distance_to(global_position) < explosion_radius
			#check if func hit in them
			if "hit" in target and in_range:
				target.hit()

#moi
#func _on_animation_player_animation_started(anim_name: StringName) -> void:
	#var explodable = []
	##player & scouts
	#for entity in get_tree().get_nodes_in_group("Entity"):
		#entities.append(entity)
	##objects
	#for container in get_tree().get_nodes_in_group("Container"):
		#containers.append(container)
	##add all
	#explodable = entities + containers
#
#
#func _on_grenade_blast_body_entered(body: Node2D) -> void:
	#pass

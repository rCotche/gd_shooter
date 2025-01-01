extends Sprite2D

var pos: Vector2 = Vector2.ZERO #Vector2(0, 0)
const speed: int = 200

var test_scale: int = 1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#position = propriete du node
	#position = Vector2(100, 200)
	pos = Vector2(300, 200)
	position = pos
	
	#var test_rotation = 45
	#rotation_degrees = test_rotation
	
	test_scale = 2
	scale = Vector2(test_scale, test_scale)
	
	#unique name is accessible partout dans la scene
	#print(%Target.position)
	
	#$".." = parant node
	print($"..".test_array)
	#just pour test, best pratice : call down signal up
	$"..".test_function()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#position.x += 10
	pos.x += speed * delta
	position = pos
	
	#scale += Vector2(0.1, 0.1)
	#0.1 fonctione pas car test_scale c'est un int
	#test_scale += 1
	#scale = Vector2(test_scale, test_scale)

extends Node2D

var test_array: Array[String] = ["test", "hello", "stuff"]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#get_node("Logo").rotation_degrees = 90
	$Logo.rotation_degrees = 90
	
	#for i in test_array:
		#print(i)
	print(test_array[0])


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$Logo.rotation_degrees += 1
	
	#if $Logo.rotation_degrees > 180:
		#$Logo.rotation_degrees = 90
	#
	if $Logo.position.x > 1000:
		#print("ça marche")
		$Logo.pos.x = 0
	#else:
		#print("pas encore " + str($Logo.position.x))

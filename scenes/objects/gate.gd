extends StaticBody2D

#declare custom signal
signal player_entered_gate(body)

func _on_area_2d_body_entered(body: Node2D) -> void:
	#print("body has entered")
	player_entered_gate.emit(body)

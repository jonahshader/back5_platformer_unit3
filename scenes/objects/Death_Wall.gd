extends Area2D

export var speed = 100
var enable_calculations = true

func _process(delta):
	position.x += delta * speed
	
	if(enable_calculations):
		position.y = get_node("../Player").position.y + get_node("../Player/Camera2D").offset.y
	
	
func disable_calculations():
	enable_calculations = false

extends Area2D

export var speed = 100

func _process(delta):
	position.x += delta * speed
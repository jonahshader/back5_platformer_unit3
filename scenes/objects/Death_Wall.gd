extends Area2D

export var speed = 300
var vel = Vector2()

func _process(delta):
	position.x += delta * speed


func _on_Death_Wall_body_entered(body):
	pass # Replace with function body.

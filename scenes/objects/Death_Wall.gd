extends Area2D

export var speed = 300

func _process(delta):
	position.x += delta * speed

func _on_Death_Wall_body_entered(body):
	get_tree().reload_current_scene()

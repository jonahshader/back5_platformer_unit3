extends Area2D


export var fuel_level = 5.0

onready var jetpack = preload("res://scenes/objects/JetPack.tscn")

func _on_JetPackPickup_body_entered(_body):
	var new_jetpack = jetpack.instance()
	new_jetpack.fuel_level = fuel_level
	get_node("../Player").add_child(new_jetpack)
	queue_free()

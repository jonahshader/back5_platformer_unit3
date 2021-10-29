extends Node



# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var on_player = false
export var fuel_level = 5.0

const THRUST_RATIO = 1.25
onready var player = get_parent()
onready var THRUST = get_node("../Player").gravity * THRUST_RATIO


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var thrusting = false
	if on_player:
		if Input.is_action_pressed("jump"):
			if fuel_level > 0:
				player.vel.y -= THRUST * delta
				fuel_level -= delta
				thrusting = true
				if fuel_level < 0:
					fuel_level = 0
	$CPUParticles2D.emitting = thrusting


func pickup():
	if on_player == false:
		#queue_free()
		var new_jetpack = get_node(".")
		new_jetpack.fuel_level = fuel_level
		new_jetpack.on_player = true
		on_player = true
		get_node("../Player").add_child(new_jetpack)
		
		


func _on_JetPack_body_entered(body):
	pickup()
	pass

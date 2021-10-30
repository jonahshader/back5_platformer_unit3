extends Node

export var fuel_level = 5.0

const THRUST_RATIO = 1.25
onready var player = get_parent()
onready var THRUST = player.gravity * THRUST_RATIO


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var thrusting = false
	if Input.is_action_just_pressed("jump") and player.is_on_floor():
		player.vel.y += player.jump_force/2 # counter act some of the jumping force
	if Input.is_action_pressed("jump"):
		if fuel_level > 0:
			player.vel.y -= THRUST * delta
			fuel_level -= delta
			thrusting = true
			if fuel_level < 0:
				fuel_level = 0
				queue_free()
	$CPUParticles2D.emitting = thrusting

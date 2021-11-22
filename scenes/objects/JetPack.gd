extends Node

export var fuel_level = 5.0

const THRUST_RATIO = 1.2
onready var player = get_parent()
onready var THRUST = player.gravity * THRUST_RATIO

onready var max_fuel = fuel_level


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var thrusting = false
	if Input.is_action_pressed("jump") and player.is_on_floor():
		player.vel.y += player.jump_force/2 # counter act some of the jumping force
	if Input.is_action_pressed("jump"):
		if fuel_level > 0:
			player.vel.y -= THRUST * delta
			if player.vel.y > 0: # addition force when player is moving down
				player.vel.y -= (THRUST / 2) * delta
			fuel_level -= delta
			thrusting = true
			if fuel_level < 0:
				fuel_level = 0
				queue_free()
	$CPUParticles2D.emitting = thrusting
	var fuel_p = fuel_level / max_fuel
	$FuelBar.rect_scale.y = fuel_p
	$FuelBar.color.r = 1 - (fuel_p)
	$FuelBar.color.g = fuel_p

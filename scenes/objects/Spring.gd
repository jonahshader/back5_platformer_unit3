extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

const SPRING_VEL = 600 * sqrt(2)
const SPRING_ACTIVATE_HEIGHT = 40
const RETRACT_SPEED = 60
var spring_height_offset = 0.0


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var change = delta * RETRACT_SPEED
	if spring_height_offset - change > 0:
		$SpringTop.margin_top += change
		$SpringTop.margin_bottom += change
		$SpringPole.margin_top += change
		spring_height_offset -= change
	elif spring_height_offset > 0:
		$SpringTop.margin_top += spring_height_offset
		$SpringTop.margin_bottom += spring_height_offset
		$SpringPole.margin_top += spring_height_offset
		spring_height_offset = 0
		


func _on_Spring_body_entered(body):
	var player = get_node("../Player")
	player.vel.y = -SPRING_VEL
	$SpringTop.margin_top -= SPRING_ACTIVATE_HEIGHT
	$SpringTop.margin_bottom -= SPRING_ACTIVATE_HEIGHT
	$SpringPole.margin_top -= SPRING_ACTIVATE_HEIGHT
	spring_height_offset += SPRING_ACTIVATE_HEIGHT

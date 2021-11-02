extends KinematicBody2D
onready var floor_detector = $OnGround
var jump_force = 600
var gravity = 800
var jump_delay = 15
var jump_timer = jump_delay
var vel = Vector2()
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass # Replace with function body.

func _physics_process(_delta):
	vel = move_and_slide(vel, Vector2.UP)
	if not floor_detector.is_colliding():
		vel.y += gravity * _delta
		jump_timer = jump_delay
	jump_timer -= 1
	if (jump_timer == 0):
			vel.y -= jump_force
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

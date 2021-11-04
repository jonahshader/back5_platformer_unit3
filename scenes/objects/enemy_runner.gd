extends KinematicBody2D
onready var floor_detector = $OnGround
onready var floor_left = $GroundToLeft
onready var floor_right = $GroundToRight
var gravity = 800
var walk_speed = 400
var vel = Vector2()

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	if (vel.x == 0):
		vel.x = walk_speed
	 # Replace with function body.

func _physics_process(_delta):
	vel = move_and_slide(vel, Vector2.UP)
	if not floor_detector.is_colliding():
		vel.y += vel.y * _delta
	if not floor_left.is_colliding():
		vel.x = walk_speed
	if not floor_right.is_colliding():
		vel.x = -(walk_speed)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _on_Area2D_body_entered(body):
	if (get_node("../Player").vel.y > 0):
		queue_free()
	else:
		get_node("../GameHud").gameover(null)
		get_node("../Player").gameover(null)
#func _process(delta):
#	pass

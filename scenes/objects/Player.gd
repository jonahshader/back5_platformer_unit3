extends KinematicBody2D

var speed = 200
var jump_force = 600
var gravity : int = 800

var vel = Vector2()

# this was originally on _physics_process but
# that only ran at 60 fps so i switched to _process
func _process(delta):
	vel.x = 0
	if Input.is_action_pressed("move_left"):
		vel.x -= speed
	if Input.is_action_pressed("move_right"):
		vel.x += speed
	
	# apply velocity using kinematicbody2d method
	vel = move_and_slide(vel, Vector2.UP)
	
	# apply gravity
	vel.y += gravity * delta
	
	if Input.is_action_just_pressed("jump") and is_on_floor():
		vel.y -= jump_force
		

func kill():
	get_node("../GameHud").disable_calculations()
	var new_cam = Camera2D.new()
	new_cam.offset = $Camera2D.offset
	$Camera2D.current = false
	new_cam.current = true
	new_cam.position = position
	get_parent().add_child(new_cam)
	queue_free()

func gameover(body):
	kill()

func survived(body):
	kill()

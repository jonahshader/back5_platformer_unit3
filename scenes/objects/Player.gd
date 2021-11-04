extends KinematicBody2D



var speed = 200
var jump_force = 600
var gravity = 800

var vel = Vector2()

# this was originally on _physics_process but
# that only ran at 60 fps so i switched to _process
# second^-1

func _ready():
	$Sprite.queue_free()
	
	var sprite_1 = preload("res://scenes/objects/playersprites/PlayerSprite1.tscn")
	var sprite_2 = preload("res://scenes/objects/playersprites/PlayerSprite2.tscn")
	var sprite_3 = preload("res://scenes/objects/playersprites/PlayerSprite3.tscn")
	
	match PlayerData.player_sprite_number:
		1:
			add_child(sprite_1.instance())
		2:
			add_child(sprite_2.instance())
		3:
			add_child(sprite_3.instance())

func _process(delta):
	vel.x = 0
	if Input.is_action_pressed("move_left"):
		vel.x -= speed
	if Input.is_action_pressed("move_right"):
		vel.x += speed
	# apply gravity
	vel.y += gravity * delta
	# apply velocity using kinematicbody2d method
	vel = move_and_slide(vel, Vector2.UP)
	
	
	
	if Input.is_action_just_pressed("jump") and is_on_floor():
		vel.y -= jump_force
		

func kill():
	get_node("../GameHud").disable_calculations()
	get_node("../Death_Wall").disable_calculations()
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

extends CanvasLayer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var player = get_node("../Player")
onready var safehouse = get_node("../Safehouse")
var dist_calculating = true
var distance_left = 0.0
var time = 0.0

func calc_dist_left():
	if dist_calculating:
		distance_left = player.position.distance_to(safehouse.position)
#	if player.is_instance_valid() or safehouse.is_instance_valid():
#		return
	
func _ready():
	$ContinueButton.hide()
	$RestartButton.hide()
	$WinLabel.hide()
	$LoseLabel.hide()
	calc_dist_left()


func _process(delta):
	calc_dist_left()
	$DistanceLeftLabel.text = "Distance Left: " + str(int(distance_left / 50))
	$TimeLabel.text = "Time: " + str(int(time))
	
	if dist_calculating:
		if player.position.y > 3500:
			player.kill()
			gameover(null)
	
	time += delta
	
func gameover(body):
	$LoseLabel.show()
	yield(get_tree().create_timer(1.5), "timeout")
	$RestartButton.show()

func survived(body):
	$WinLabel.show()
	yield(get_tree().create_timer(1.5), "timeout")
	$ContinueButton.show()

func _on_ContinueButton_pressed():
	if ResourceLoader.exists("res://scenes/levels/Level_" + str(int(get_tree().current_scene.name) + 1) + ".tscn"):
		get_tree().change_scene("res://scenes/levels/Level_" + str(int(get_tree().current_scene.name) + 1) + ".tscn")
	else:
		get_tree().change_scene("res://scenes/menus/PrototypeEnd.tscn")

func _on_RestartButton_pressed():
	get_tree().change_scene("res://scenes/levels/Level_1.tscn")
	
func disable_calculations():
	dist_calculating = false


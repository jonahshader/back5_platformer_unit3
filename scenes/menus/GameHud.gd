extends CanvasLayer


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
	$TimeLabel.hide() # don't need this currently
	$ContinueButton.hide()
	$RestartButton.hide()
	$WinLabel.hide()
	$LoseLabel.hide()
	$LevelLabel.text = "Level " + get_tree().current_scene.name
	calc_dist_left()
	Music.start_music()


func _process(delta):
	calc_dist_left()
	$DistanceLeftLabel.text = "Distance Left: " + str(int(distance_left / 50))
	if dist_calculating:
		$TimeLabel.text = "Time: " + str(int(time))
	
	if dist_calculating:
		if player.position.y > 3500:
			player.kill()
			gameover(null)
	
	time += delta
	
func gameover(body):
	Music.gameover_or_survived()
	$LoseLabel.show()
	yield(get_tree().create_timer(1.5), "timeout")
	$RestartButton.show()

func survived(body):
	Music.gameover_or_survived()
	$WinLabel.show()
	yield(get_tree().create_timer(1.5), "timeout")
	$ContinueButton.show()

func _on_ContinueButton_pressed():
	if ResourceLoader.exists("res://scenes/levels/Level_" + str(int(get_tree().current_scene.name) + 1) + ".tscn"):
		get_tree().change_scene("res://scenes/levels/Level_" + str(int(get_tree().current_scene.name) + 1) + ".tscn")
	else:
		get_tree().change_scene("res://scenes/menus/PrototypeEnd.tscn")

func _on_RestartButton_pressed():
	get_tree().reload_current_scene()
	
func disable_calculations():
	dist_calculating = false



func _on_Safehouse_body_entered(body):
	pass # Replace with function body.

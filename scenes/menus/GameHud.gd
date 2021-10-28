extends CanvasLayer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var player = get_node("../Player")
onready var safehouse = get_node("../Safehouse")
var distance_left = 0.0
var time = 0.0

func calc_dist_left():
	distance_left = player.position.distance_to(safehouse.position)
	
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
	time += delta
	
func gameover():
	$LoseLabel.show()
	yield(get_tree().create_timer(1.5), "timeout")
	$RestartButton.show()

func survived():
	$WinLabel.show()
	yield(get_tree().create_timer(1.5), "timeout")
	$ContinueButton.show()
	


func _on_ContinueButton_pressed():
	


func _on_RestartButton_pressed():
	pass # Replace with function body.

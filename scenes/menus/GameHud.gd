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
	calc_dist_left()


func _process(delta):
	calc_dist_left()
	$DistanceLeftLabel.text = "Distance Left: " + str(int(distance_left))
	$TimeLabel.text = "Time: " + str(int(time))
	time += delta

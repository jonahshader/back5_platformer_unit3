extends Node

func _on_SpikeTrap_body_entered(body):
	# collided with player
	# kill player lol
	get_node("../GameHud").gameover(null)
	get_node("../Player").gameover(null)
	

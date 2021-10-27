extends Area2D

func _on_Safehouse_body_entered(body):
	$ButtonDelay.start()

func _on_ButtonDelay_timeout():
	$Button.disabled = false
	$Button.show()
	$ColorRect.color = Color(0,255,0)

# This will be moved to a completion screen for each level later
# The safehouse will simply bring up the completion screen instead
func _on_Button_pressed():
	if ResourceLoader.exists("res://scenes/Level_" + str(int(get_tree().current_scene.name) + 1) + ".tscn"):
		get_tree().change_scene("res://scenes/Level_" + str(int(get_tree().current_scene.name) + 1) + ".tscn")
	else:
		get_tree().change_scene("res://scenes/Main.tscn")

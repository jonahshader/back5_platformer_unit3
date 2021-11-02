extends Node2D

func _on_Char_1_Btn_button_down():
	PlayerData.player_sprite_number = 1
	get_tree().change_scene("res://scenes/levels/Level_1.tscn")

func _on_Char_2_Btn_button_down():
	PlayerData.player_sprite_number = 2
	get_tree().change_scene("res://scenes/levels/Level_1.tscn")

func _on_Char_3_Btn_button_down():
	PlayerData.player_sprite_number = 3
	get_tree().change_scene("res://scenes/levels/Level_1.tscn")

extends Node2D

func _on_pvp_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/partie.tscn")
	GameData.game_type = "pvp"

func _on_pve_button_pressed() -> void:
	GameData.game_type = "pve"
	get_tree().change_scene_to_file("res://scenes/partie.tscn")

func _on_exit_button_pressed() -> void:
	get_tree().quit()

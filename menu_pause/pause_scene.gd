extends Control


@onready var restart = $"."
var scene_to_load = "res://scene TitleScreen/titlescene.tscn"



func _on_restart_button_pressed():
	restart.pauseMenu()


func _on_quit_party_button_pressed():
	get_tree().change_scene_to_file(scene_to_load)

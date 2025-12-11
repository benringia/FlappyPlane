extends Node

const MAIN = preload("uid://cxt5x3kdbarw8")
const GAME = preload("uid://symtsri6e0xp")


func load_main_scene() -> void:
	get_tree().change_scene_to_packed(MAIN)
	
func load_game_scene() -> void:
	get_tree().change_scene_to_packed(GAME)

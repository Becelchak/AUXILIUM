extends Node2D

onready var player = get_node("/root/PlayerData")
onready var next_scene = "res://Scenes/Chapter_I.tscn"

func get_player():
	return player
	
func _ready():
	player.popup.path_next(next_scene)
	pass

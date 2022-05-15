extends Node2D

onready var water = $Buttons/Water
onready var ready = $Buttons/Ready
onready var exit = $Buttons/Exit
onready var player = get_node("/root/PlayerData")

func _ready():
	exit.set_next_scene("res://Scenes/MainGame.tscn")
	exit.connect("pressed", self, "change_scene", [exit.scene_to_open])
	water.connect("pressed", self, "set_atanor",[water])
	ready.connect("pressed", self, "set_atanor",[ready])
		
		
func change_scene(path):
	SceneChanger.change_scene(path)

func set_atanor(button):
	if button == water:
		var atanorF = $Craft/Atanor/Full
		var atanorE = $Craft/Atanor/Empty
		atanorF.visible = true
		atanorE.visible = false
	elif button == ready:
		var atanorF = $Craft/Atanor/Full
		var atanorE = $Craft/Atanor/Empty
		atanorF.visible = false
		atanorE.visible = true

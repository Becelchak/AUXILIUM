extends Node2D

onready var water = $Buttons/Water
onready var delete = $Buttons/Delete
onready var exit = $Buttons/Exit
onready var player = get_node("/root/PlayerData")

func _ready():
	exit.set_next_scene("res://Scenes/MainGame.tscn")
	exit.connect("pressed", self, "change_scene", [exit.scene_to_open])
	water.connect("pressed", self, "set_atanor",[water])
	delete.connect("pressed", self, "set_atanor",[delete])
		
		
func change_scene(path):
	SceneChanger.change_scene(path)

func set_atanor(button):
	if button == water:
		var atanorF = $Craft/Atanor/Full
		var atanorE = $Craft/Atanor/Empty
		atanorF.visible = true
		atanorE.visible = false
		$Craft/Atanor/Menu.add_water()
	elif button == delete:
		var atanorF = $Craft/Atanor/Full
		var atanorE = $Craft/Atanor/Empty
		atanorF.visible = false
		atanorE.visible = true
		player.atanorItems.clear()
		$Craft/Atanor/Menu.update_item_lists()

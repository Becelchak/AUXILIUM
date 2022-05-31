extends Node2D

onready var water = $Buttons/Water
onready var delete = $Buttons/Delete
onready var exit = $Buttons/Exit
onready var retur = $HelpMenu/Setting/Return
onready var help = $Help
onready var repeat = $HelpMenu/Setting/Repeat
onready var player = get_node("/root/PlayerData")

func _ready():
	if player.Is_tutorial:
		exit.visible = false
		help.visible = true
		help.connect("pressed", self, "toggle_help_menu",[help])
		retur.connect("pressed", self, "toggle_help_menu",[retur])
		repeat.connect("pressed", self, "set_atanor",[repeat])
		water.connect("pressed", self, "set_atanor",[water])
		delete.connect("pressed", self, "set_atanor",[delete])
		exit.set_next_scene("res://Scenes/Chapter_I-2.tscn")
		exit.connect("pressed", self, "change_scene", [exit.scene_to_open])
	else:
		exit.set_next_scene("res://Scenes/MainGame.tscn")
		exit.connect("pressed", self, "change_scene", [exit.scene_to_open])
		water.connect("pressed", self, "set_atanor",[water])
		delete.connect("pressed", self, "set_atanor",[delete])
		
		
func change_scene(path):
	if player.Need_new_Chapter:
		SceneChanger.change_scene("res://Scenes/Chapter_III.tscn")
		player.Need_new_Chapter = false
	elif player.Is_game_finish:
		SceneChanger.change_scene("res://Scenes/Finish.tscn")
	else:
		SceneChanger.change_scene(path)

func toggle_help_menu(item):
	if !$HelpMenu.visible:
		$HelpMenu.visible = true
	elif $HelpMenu.visible:
		$HelpMenu.visible = false

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
	elif button == repeat:
		player.inventory.clear()
		player.atanorItems.clear()
		player.inventory["Romashka"] = [3,20]
		$Craft/Atanor/Menu.update_item_lists()

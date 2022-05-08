extends Node2D

onready var craft = $Buttons/Craft
onready var location = $Buttons/Location
onready var question = $Buttons/Question
onready var menu = $Buttons/Menu

func _ready():
	craft.set_next_scene("res://Scenes/Craft.tscn")
	craft.connect("pressed", self, "change_scene", [craft.scene_to_open])
	location.connect("pressed", self, "toggle_menu",[location])
	menu.connect("pressed", self, "toggle_menu",[menu])
		
		
func change_scene(path):
	SceneChanger.change_scene(path)

func toggle_menu(button):
	if button == location:
		var menus = get_node("/root/Ui/Locations")
		menus.visible = true
	elif button == menu:
		var menus = get_node("/root/Ui/GameMenu")
		menus.visible = true

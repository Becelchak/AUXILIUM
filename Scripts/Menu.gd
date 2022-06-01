extends Control
onready var start = $Buttons/Start
onready var setting = $Buttons/Setting
onready var end = $Buttons/End

func _ready():
	start.set_next_scene("res://Scenes/Prolog.tscn") 
	start.connect("pressed", self, "change_scene", [start.scene_to_open])
	setting.connect("pressed", self, "toggle_menu", [setting])
	end.connect("pressed",self,"quit_game",[end])
	
func change_scene(path):
	SceneChanger.change_scene(path)

func quit_game(button):
	get_tree().quit()

func toggle_menu(button):
	$Setting.visible = true

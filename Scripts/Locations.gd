extends Control

onready var loc = $Panel/ItemList
onready var start = $Buttons/Start
onready var retur = $Buttons/Return
onready var player = get_node("/root/PlayerData")
var next_location = ""

func _ready():
	loc.connect("item_selected", self, "set_next_location")
	start.connect("pressed", self, "change_scene", [start])
	retur.connect("pressed", self, "close_menu", [retur])

func set_next_location(item):
	var name_loc = text_item(item)
	if name_loc == "Огород":
		next_location = "res://Scenes/Garden.tscn"
	elif name_loc == "Сад":
		next_location = "res://Scenes/Garden2.tscn"
	elif name_loc == "Лес":
		next_location = "res://Scenes/Forest.tscn"
	elif name_loc == "Поляна":
		next_location = "res://Scenes/Shrouding.tscn"
	elif name_loc == "Болото":
		next_location = "res://Scenes/Swamp.tscn"
	elif name_loc == "Пещера":
		next_location = "res://Scenes/Cave.tscn"

func text_item(item):
	var g = loc.get_item_text(item)
	return g

func close_menu(item):
	self.visible = false

func change_scene(item):
	SceneChanger.change_scene(next_location)
	self.visible = false

extends Control

onready var loc = $Panel/ItemList
onready var start = $Buttons/Start
var next_location = ""

func _ready():
	loc.connect("item_selected", self, "set_next_location")
	start.connect("pressed", self, "change_scene", [start])

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

func change_scene(item):
	SceneChanger.change_scene(next_location)
	self.visible = false

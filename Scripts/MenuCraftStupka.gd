extends Control

onready var craft = $Panel/Buttons/Craft
onready var retur = $Panel/Buttons/Return
onready var atanor = $Panel/Buttons/TakeAtanor
onready var scale = $Panel/Buttons/TakeScale
onready var items = $Panel/ItemsMenu/Grid/ColorRect/ItemList
onready var player = get_node("/root/PlayerData")

onready var atanor_invent = get_parent().get_parent().get_child(0)
onready var scale_invent = get_parent().get_parent().get_child(1)
onready var fyer_invent = get_parent().get_parent().get_child(3)

var item_now = ""
var item_craft = ""
var formul_craft = ""
var concentrate_craft = 0

func _ready():
	items.connect("item_selected", self, "set_now_item")
	retur.connect("pressed",self, "toggle_menu", [retur])
	craft.connect("pressed",self, "set_reaction", [craft])
	atanor.connect("pressed",self, "set_reaction", [atanor])
	scale.connect("pressed",self, "set_reaction", [scale])

func toggle_menu(button):
	var parent = button.get_parent().get_parent().get_parent()
	parent.visible = false

func set_reaction(button):
	if button == atanor:
		player.delete_item(item_now)
		if item_now in player.atanorItems:
			player.atanorItems[item_now][0] += 1
		else:
			player.atanorItems[item_now] = [1, 9]
		update_item_lists()
	elif button == scale:
		player.delete_item(item_now)
		if item_now in player.scalesItems:
			player.scalesItems[item_now][0] += 1
		else:
			player.scalesItems[item_now] = [1, 9]
		update_item_lists()
	elif button == craft:
		var result = craft_item(item_now).split(" ")
		item_craft = result[0]
		formul_craft = result[1]
		concentrate_craft = int(result[2])
		if item_now in player.atanorItems:
			player.inventory[item_craft][0] += concentrate_craft
		else:
			player.inventory[item_craft] = [concentrate_craft, 40]
		update_item_lists()

func set_now_item(item):
	var arr = items.get_item_text(item).split(" ")
	item_now = arr[0]

func update_item_lists():
	$Panel/ItemsMenu._ready()
	atanor_invent.get_child(2).get_child(0).get_child(0)._ready()
	scale_invent.get_child(1).get_child(0).get_child(0)._ready()
	fyer_invent.get_child(1).get_child(0).get_child(0)._ready()

func craft_item(item):
	if item in player.minerals:
		if item == "Coal":
			return "Coal"
		elif item == "Sulfur":
			return "Sulfur"
	elif item in player.herbs:
		if item == "Nezabudka":
			return "Nezabudka_conc Flavon 5"

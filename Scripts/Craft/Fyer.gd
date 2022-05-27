extends Control

onready var fire = $Panel/Buttons/Fire
onready var retur = $Panel/Buttons/Return
onready var atanor = $Panel/Buttons/TakeAtanor
onready var scale = $Panel/Buttons/TakeScale
onready var items = $Panel/ItemsMenu/Grid/ColorRect/ItemList
onready var player = get_node("/root/PlayerData")

onready var atanor_invent = get_parent().get_parent().get_child(0)
onready var scale_invent = get_parent().get_parent().get_child(1)
onready var stupka_invent = get_parent().get_parent().get_child(2)

var item_now = ""
var item_craft = ""
var formul_craft = ""
var concentrate_craft = 0

func _ready():
	items.connect("item_selected", self, "set_now_item")
	retur.connect("pressed",self, "toggle_menu", [retur])
	atanor.connect("pressed",self, "set_reaction", [atanor])
	scale.connect("pressed",self, "set_reaction", [scale])
	fire.connect("pressed",self, "set_reaction", [fire])

func toggle_menu(button):
	var parent = button.get_parent().get_parent().get_parent()
	$Panel/Fyer/Result.visible = false
	$Panel/Fyer/LabelRect.visible = false
	$Panel/Fyer/LabelRect/Fall.visible = false
	$Panel/Fyer/LabelRect/Success.visible = false
	parent.visible = false

func set_reaction(button):
	if button == atanor:
		player.delete_item(item_now)
		$Panel/Fyer/Result.visible = false
		$Panel/Fyer/LabelRect.visible = false
		$Panel/Fyer/LabelRect/Fall.visible = false
		$Panel/Fyer/LabelRect/Success.visible = false
		if item_now in player.atanorItems:
			player.atanorItems[item_now][0] += 1
		else:
			player.atanorItems[item_now] = [1, 9]
		update_item_lists()
	elif button == scale:
		player.delete_item(item_now)
		$Panel/Fyer/Result.visible = false
		$Panel/Fyer/LabelRect.visible = false
		if item_now in player.scalesItems:
			player.scalesItems[item_now][0] += 1
		else:
			player.scalesItems[item_now] = [1, 9]
		update_item_lists()
	elif button == fire:
		var result = craft_item(item_now).split(" ")
		item_craft = result[0]
		formul_craft = result[1]
		concentrate_craft = int(result[2])
		$Panel/Fyer/Result.texture = load("res://items/Grasses/Formuls/%s.png" % formul_craft)
		$Panel/Fyer/Result.visible = true
		$Panel/Fyer/LabelRect.visible = true
		if(item_craft == "Ashes"):
			$Panel/Fyer/LabelRect/Fall.visible = true
			$Panel/Fyer/LabelRect/Success.visible = false
		else:
			$Panel/Fyer/LabelRect/Success.visible = true
			$Panel/Fyer/LabelRect/Fall.visible = false
		if item_craft in player.inventory.keys():
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
	stupka_invent.get_child(1).get_child(0).get_child(0)._ready()

func craft_item(item):
	if item == "Sulfur":
		player.inventory[item][0] -= 1
		update_item_lists()
		return "GazSulf Dioxid_sulfur 2"
	elif item == "Chlorid_Natrium":
		player.inventory[item][0] -= 1
		update_item_lists()
		return "SulfNatri Sulfat_natri 2"
	elif item == "Koriaga" && player.inventory[item][0] >=3:
		player.inventory[item][0] -= 3
		update_item_lists()
		return "Coal X 2"
	elif item == "Romashka" && player.inventory[item][0] >= 10:
		player.inventory[item][0] -= 10
		update_item_lists()
		return "Romashka_ashes Magni 1"
	else:
		player.inventory[item][0] -= 1
		update_item_lists()
		return "Ashes Calium 1"

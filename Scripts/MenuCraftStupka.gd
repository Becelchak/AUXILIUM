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
	$Panel/Stupka/Result.visible = false
	$Panel/Stupka/LabelRect.visible = false
	$Panel/Stupka/LabelRect/Fall.visible = false
	$Panel/Stupka/LabelRect/Success.visible = false
	parent.visible = false

func set_reaction(button):
	if button == atanor:
		player.delete_item(item_now)
		$Panel/Stupka/Result.visible = false
		$Panel/Stupka/LabelRect.visible = false
		$Panel/Stupka/LabelRect/Fall.visible = false
		$Panel/Stupka/LabelRect/Success.visible = false
		if item_now in player.atanorItems:
			player.atanorItems[item_now][0] += 1
		else:
			player.atanorItems[item_now] = [1, 9]
		update_item_lists()
	elif button == scale:
		player.delete_item(item_now)
		$Panel/Stupka/Result.visible = false
		$Panel/Stupka/LabelRect.visible = false
		$Panel/Stupka/LabelRect/Fall.visible = false
		$Panel/Stupka/LabelRect/Success.visible = false
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
		player.update_main_quest(item_craft)
		player.check_progress()
		$Panel/Stupka/Result.texture = load("res://items/Grasses/Formuls/%s.png" % formul_craft)
		$Panel/Stupka/Result.visible = true
		$Panel/Stupka/LabelRect.visible = true
		if(item_craft == "Bruh"):
			$Panel/Stupka/LabelRect/Fall.visible = true
			$Panel/Stupka/LabelRect/Success.visible = false
		else:
			$Panel/Stupka/LabelRect/Success.visible = true
			$Panel/Stupka/LabelRect/Fall.visible = false
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
	fyer_invent.get_child(1).get_child(0).get_child(0)._ready()

func craft_item(item):
	if item != null:
		if item in player.minerals:
			if item == "Coal":
				player.inventory[item][0] -= 1
				update_item_lists()
				return "Coal Carbon 1"
			elif item == "Sulfur":
				player.inventory[item][0] -= 1
				update_item_lists()
				return "Sulfur Sulfur 1"
			elif item == "Ferum":
				player.inventory[item][0] -= 1
				update_item_lists()
				return "Ferum_conc X 2"
		elif item in player.herbs:
			if item == "Nezabudka":
				player.inventory[item][0] -= 1
				update_item_lists()
				return "Nezabudka_conc Magni 2"
			elif item == "Koriaga":
				player.inventory[item][0] -= 1
				update_item_lists()
				return "Wood_conc X 2"
			elif item == "Romashka":
				player.inventory[item][0] -= 1
				update_item_lists()
				return "Romashka_conc Magni 1"
			elif item == "Landish":
				player.inventory[item][0] -= 1
				update_item_lists()
				return "Landish_conc Phosphorus 1"
			elif item == "Limon" && player.inventory[item][0] == 2:
				player.inventory[item][0] -= 2
				update_item_lists()
				return "Limon_acid Calium 1"
		else:
			player.inventory[item][0] -= 1
			update_item_lists()
			return "Bruh X 1"

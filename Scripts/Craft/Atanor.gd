extends Control

onready var retur = $Panel/Buttons/Return
onready var delete = $Panel/Buttons/Delete
onready var craft = $Panel/Buttons/Craft
onready var items = $Panel/ItemsMenu/Grid/ColorRect/ItemList
onready var player = get_node("/root/PlayerData")

onready var stupka_invent = get_parent().get_parent().get_child(2)
onready var scale_invent = get_parent().get_parent().get_child(1)
onready var fyer_invent = get_parent().get_parent().get_child(3)

var count_items = 0
var total_items = {}

var item_now = ""
var item_craft = ""
var formul_craft = ""
var concentrate_craft = 0

func _ready():
	items.connect("item_selected", self, "set_now_item")
	retur.connect("pressed",self, "toggle_menu", [retur])
	delete.connect("pressed",self, "set_reaction", [delete])
	craft.connect("pressed",self, "set_reaction", [craft])

func toggle_menu(button):
	var parent = button.get_parent().get_parent().get_parent()
	$Panel/Stupka/Result.visible = false
	$Panel/Stupka/LabelRect.visible = false
	$Panel/Stupka/LabelRect/Fall.visible = false
	$Panel/Stupka/LabelRect/Success.visible = false
	parent.visible = false

func set_reaction(button):
	if button == delete && item_now != "":
		player.atanorItems[item_now][0] -= 1
		$Panel/Stupka/Result.visible = false
		$Panel/Stupka/LabelRect.visible = false
		$Panel/Stupka/LabelRect/Fall.visible = false
		$Panel/Stupka/LabelRect/Success.visible = false
		update_item_lists()
	elif button == craft:
		item_now = ""
		for i in items.get_item_count():
			var arr = items.get_item_text(i).split(" ")
			count_items += int(arr[1])
			total_items[i] = [arr[0], arr[1]]
		var result = craft_item(total_items, count_items).split(" ")
		item_craft = result[0]
		formul_craft = result[1]
		concentrate_craft = int(result[2])
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
	stupka_invent.get_child(1).get_child(0).get_child(0)._ready()
	scale_invent.get_child(1).get_child(0).get_child(0)._ready()
	fyer_invent.get_child(1).get_child(0).get_child(0)._ready()

func craft_item(item, count):
	if count == 1:
		if item[0].has("Coal"):
			for i in item.size():
				var its = item[i][0]
				var couts = int(item[i][1])
				player.atanorItems[its][0] -= couts
			count_items = 0
			update_item_lists()
			return "Coal X 1"
		if item[0].has("GazSulf"):
			for i in item.size():
				var its = item[i][0]
				var couts = int(item[i][1])
				player.atanorItems[its][0] -= couts
			count_items = 0
			update_item_lists()
			return "WaterSulf Trioxid_sulfur 1"
		else:
			count_items = 0
			for i in item.size():
				var its = item[i][0]
				var couts = int(item[i][1])
				player.atanorItems[its][0] -= couts
			update_item_lists()
			return "%s X 1" %item[0][0]
	elif count == 2:
		if item[0].has("Sulfur") && item[1].has("Ferum_conc") || item[1].has("Sulfur") && item[0].has("Ferum_conc") :
			for i in item.size():
				var its = item[i][0]
				var couts = int(item[i][1])
				player.atanorItems[its][0] -= couts
			count_items = 0
			update_item_lists()
			return "SulFer Sulfid_Ferum 1"
		elif item[0].has("SulfAcid") && item[1].has("Chlorid_Natrium") || item[1].has("SulfAcid") && item[0].has("Chlorid_Natrium") :
			for i in item.size():
				var its = item[i][0]
				var couts = int(item[i][1])
				player.atanorItems[its][0] -= couts
			count_items = 0
			update_item_lists()
			return "HydroAcid Hydrochloric_acid 1"
		else:
			count_items = 0
			for i in item.size():
				var its = item[i][0]
				var couts = int(item[i][1])
				player.atanorItems[its][0] -= couts
			update_item_lists()
			return "Bruh X 1"
	elif count == 3:
		if item[0].has("Water") && item[1].has("WaterSulf") || item[1].has("Water") && item[0].has("WaterSulf"):
			for i in item.size():
				var its = item[i][0]
				var couts = int(item[i][1])
				player.atanorItems[its][0] -= couts
			count_items = 0
			update_item_lists()
			return "SulfAcid Sulphuric_acid 1"
		else:
			count_items = 0
			for i in item.size():
				var its = item[i][0]
				var couts = int(item[i][1])
				player.atanorItems[its][0] -= couts
			update_item_lists()
			return "Bruh X 1"
	else:
		count_items = 0
		for i in item.size():
			var its = item[i][0]
			var couts = int(item[i][1])
			player.atanorItems[its][0] -= couts
		update_item_lists()
		return "Bruh X 1"

func add_water():
	for i in items.get_item_count():
		var arr = items.get_item_text(i).split(" ")
		if arr[0] == "Water":
			var count_Water = int(arr[1]) + 2
			var new_text = "Water x%s" % String(count_Water)
			player.atanorItems["Water"][0] += 2
			items.set_item_text(i, new_text)
		else:
			items.add_item("Water x2")
			player.atanorItems["Water"] = [2,80]
	if items.get_item_count() == 0:
		items.add_item("Water x2")
		player.atanorItems["Water"] = [2,80]
			

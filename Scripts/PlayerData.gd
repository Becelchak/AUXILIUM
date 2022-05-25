extends KinematicBody2D

onready var ui = get_node("/root/Ui/Inventory")
onready var popup = get_node("/root/Ui/Attention")

var items = 0
var maxItems = 0
var inventory = {}
var scalesItems = {}
var atanorItems = {}
var minerals = ["Coal", "Sulfur"]
var herbs = ["Nezabudka", "Romashka"]
var other = ["GazSulf", "WaterSulf", "Bruh"]

func _ready():
	pass

func pick(item):
	var object = item.get_item()
	if object in  inventory.keys():
		inventory[object][0] += item.get_amount()
	else: 
		inventory[object] = [item.get_amount(), item.get_item_stack()]
	items += 1
	ui.update_inventory(inventory)
	if((maxItems == items) && (items != 0)):
			popup.popup()
			maxItems = 0
			items = 0

func setMaxItem(count):
	maxItems = count

func change_scene(path):
	SceneChanger.change_scene(path)

func _unhandled_input(event):
	if event.is_action_pressed("InventoryOpen"):
		ui.toggle_inventory(inventory)

func delete_item(item):
	if item in inventory.keys():
		inventory[item][0] -= 1
	else:
		pass

extends KinematicBody2D

onready var ui = get_node("/root/Ui/Inventory")
onready var popup = get_node("/root/Ui/Attention")

var items = 0
var maxItems = 0
var inventory = {}
var scalesItems = {}
var atanorItems = {}
var minerals = ["Coal", "Sulfur", "Ferum","Chlorid_Natrium"]
var herbs = ["Nezabudka", "Romashka","Koriaga", "Landish", "Limon", "Zemlianika"]
var other = ["GazSulf", "WaterSulf", "Bruh"]

onready var main_quest = [["GazSulf",0],["WaterSulf",0],["SulfAcid",0],["HydroAcid",0],["Nezabudka_Infusion",0],["Landish_Infusion",0],["Celuloza",0],["SulFer",0],["SulfNatri",0], ["Juice",0]]

onready var Is_last_quest = false
onready var Need_new_Chapter = false
onready var Is_game_finish = false
onready var Is_tutorial = true

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

func check_progress():
	var count = 0
	for i in main_quest.size():
		count += main_quest[i][1]
	if count == 9:
		Is_last_quest = true
		Need_new_Chapter = true
	elif count == 10:
		Is_game_finish = true

func update_main_quest(item):
	if item != "Bruh":
		for j in main_quest.size():
			if main_quest[j][0] == item && main_quest[j][1] == 0:
				main_quest[j][1] = 1

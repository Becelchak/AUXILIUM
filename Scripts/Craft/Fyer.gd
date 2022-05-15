extends Control

onready var fire = $Panel/Buttons/Fire
onready var retur = $Panel/Buttons/Return
onready var atanor = $Panel/Buttons/TakeAtanor
onready var scale = $Panel/Buttons/TakeScale
onready var items = $Panel/ItemsMenu/Grid/ColorRect/ItemList

onready var atanor_invent = get_parent().get_parent().get_child(0)
onready var scale_invent = get_parent().get_parent().get_child(1)
onready var stupka_invent = get_parent().get_parent().get_child(2)

var item_now = ""

func _ready():
	items.connect("item_selected", self, "set_now_item")
	retur.connect("pressed",self, "toggle_menu", [retur])
	atanor.connect("pressed",self, "set_reaction", [atanor])
	scale.connect("pressed",self, "set_reaction", [scale])

func toggle_menu(button):
	var parent = button.get_parent().get_parent().get_parent()
	parent.visible = false

func set_reaction(button):
	if button == atanor:
		var player = get_node("/root/PlayerData")
		player.delete_item(item_now)
		if item_now in player.atanorItems:
			player.atanorItems[item_now][0] += 1
		else:
			player.atanorItems[item_now] = [1, 9]
		update_item_lists()
	elif button == scale:
		var player = get_node("/root/PlayerData")
		player.delete_item(item_now)
		if item_now in player.scalesItems:
			player.scalesItems[item_now][0] += 1
		else:
			player.scalesItems[item_now] = [1, 9]
		update_item_lists()

func set_now_item(item):
	var arr = items.get_item_text(item).split(" ")
	item_now = arr[0]

func update_item_lists():
	$Panel/ItemsMenu._ready()
	atanor_invent.get_child(2).get_child(0).get_child(0)._ready()
	scale_invent.get_child(1).get_child(0).get_child(0)._ready()
	stupka_invent.get_child(1).get_child(0).get_child(0)._ready()

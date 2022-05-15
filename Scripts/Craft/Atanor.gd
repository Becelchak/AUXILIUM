extends Control

onready var retur = $Panel/Buttons/Return
onready var delete = $Panel/Buttons/Delete
onready var items = $Panel/ItemsMenu/Grid/ColorRect/ItemList
onready var player = get_node("/root/PlayerData")

onready var stupka_invent = get_parent().get_parent().get_child(2)
onready var scale_invent = get_parent().get_parent().get_child(1)
onready var fyer_invent = get_parent().get_parent().get_child(3)

var item_now = ""

func _ready():
	items.connect("item_selected", self, "set_now_item")
	retur.connect("pressed",self, "toggle_menu", [retur])
	delete.connect("pressed",self, "set_reaction", [delete])

func toggle_menu(button):
	var parent = button.get_parent().get_parent().get_parent()
	parent.visible = false

func set_reaction(button):
	if button == delete:
		player.atanorItems[item_now][0] -= 1
	update_item_lists()

func set_now_item(item):
	var arr = items.get_item_text(item).split(" ")
	item_now = arr[0]

func update_item_lists():
	$Panel/ItemsMenu._ready()
	stupka_invent.get_child(1).get_child(0).get_child(0)._ready()
	scale_invent.get_child(1).get_child(0).get_child(0)._ready()
	fyer_invent.get_child(1).get_child(0).get_child(0)._ready()

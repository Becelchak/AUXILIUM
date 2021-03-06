extends Node2D

onready var item = preload("res://Scenes/Item.tscn")
var maxItems = 4
onready var player = get_node("/root/PlayerData")

func _ready():
	if player.Is_last_quest:
		var items = ["Romashka", "Koriaga","Zemlianika"]
		player.setMaxItem(maxItems)
		for i in range(maxItems):
			randomize()
			var name = int(rand_range(0,3))
			var new_item = item.instance()
			$Items.add_child(new_item)
			new_item.set_item(items[name])
			new_item.position = Vector2(int(rand_range(750,1400)), int(rand_range(750,950)))
	else:
		var items = ["Romashka", "Koriaga"]
		player.setMaxItem(maxItems)
		for i in range(maxItems):
			randomize()
			var name = int(rand_range(0,2))
			var new_item = item.instance()
			$Items.add_child(new_item)
			new_item.set_item(items[name])
			new_item.position = Vector2(int(rand_range(750,1400)), int(rand_range(750,950)))

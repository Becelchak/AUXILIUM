extends Node2D
onready var item = preload("res://Scenes/Item.tscn")
onready var player = get_node("/root/PlayerData")
var maxItems = 3

func _ready():
	if player.Is_last_quest:
		var items = ["Romashka", "Limon"]
		player.setMaxItem(maxItems)
		for i in range(maxItems):
			randomize()
			var name = int(rand_range(0,2))
			var new_item = item.instance()
			$Items.add_child(new_item)
			new_item.set_item(items[name])
			new_item.position = Vector2(int(rand_range(900,1400)), int(rand_range(900,950)))
	else:
		var items = ["Romashka"]
		player.setMaxItem(maxItems)
		for i in range(maxItems):
			randomize()
			var name = int(rand_range(0,1))
			var new_item = item.instance()
			$Items.add_child(new_item)
			new_item.set_item(items[name])
			new_item.position = Vector2(int(rand_range(900,1400)), int(rand_range(900,950)))

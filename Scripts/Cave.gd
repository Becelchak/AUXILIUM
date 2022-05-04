extends Node2D
onready var item = preload("res://Scenes/Item.tscn")
onready var player = get_node("/root/PlayerData")
var maxItems = 6

func _ready():
	var items = ["Coal"]
	player.setMaxItem(maxItems)
	for i in range(maxItems):
		randomize()
		var name = int(rand_range(0,1))
		var new_item = item.instance()
		$Items.add_child(new_item)
		new_item.set_item(items[name])
		new_item.position = Vector2(int(rand_range(850,550)), int(rand_range(400,950)))
	pass

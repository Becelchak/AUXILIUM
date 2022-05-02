extends Node2D
onready var item = preload("res://Scenes/Item.tscn")
var maxItems = 3

func _ready():
	var items = ["Romashka", "TestGrass"]
	var player = get_parent().get_player()
	player.setMaxItem(maxItems)
	for i in range(maxItems):
		randomize()
		var name = int(rand_range(0,2))
		var new_item = item.instance()
		$Items.add_child(new_item)
		new_item.set_item(items[name])
		new_item.position = Vector2(int(rand_range(600,1100)), int(rand_range(600,850)))
	pass

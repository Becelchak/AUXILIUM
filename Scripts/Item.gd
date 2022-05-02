extends Node2D

var item = ""

func set_item(item_name):
	$Sprite.texture = load("res://items/Grasses/%s.png" % item_name)
	item = item_name
	
func _ready():
	pass

func _input(event):
	if event is InputEventMouseButton:
		var player = get_parent().get_parent().get_parent().get_player()
		if abs(event.position.x - position.x) < 50 and abs(event.position.y - position.y) < 50 :
			print("Mouse Click/Unclick at: ", event.position)
			get_parent().remove_child(self)
			player.pick(item)

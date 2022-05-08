extends Node2D

var item = ""
var amount = 1
var stack_count = 9
onready var player = get_node("/root/PlayerData")

func set_item(item_name):
	$Sprite.texture = load("res://items/Grasses/%s.png" % item_name)
	item = item_name
	
func _ready():
	pass

func get_item():
	return item
	
func get_amount():
	return amount

func get_item_stack():
	return stack_count

func _input(event):
	if event is InputEventMouseButton:
		if abs(event.position.x - position.x) < 50 and abs(event.position.y - position.y) < 50 :
			get_parent().remove_child(self)
			player.pick(self)

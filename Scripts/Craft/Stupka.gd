extends Node2D


func _ready():
	pass

func _input(event):
	if event is InputEventMouseButton:
		if abs(event.position.x - position.x) < 50 and abs(event.position.y - position.y) < 50 :
			var menu = $Menu
			menu.visible = true

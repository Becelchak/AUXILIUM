extends KinematicBody2D
var items = 0
var maxItems = 0

func _ready():
	pass

func pick(item):
	items += 1
	print("Items %s" % str(items))
	if((maxItems == items) && (items != 0)):
		for i in range (0,10):
			if(i == 8):
				print("Вставить оповещение")
				change_scene("res://Scenes/Chapter_I.tscn")

func setMaxItem(count):
	maxItems = count

func change_scene(path):
	SceneChanger.change_scene(path)

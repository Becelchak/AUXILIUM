extends NinePatchRect

onready var item = preload("res://Scenes/InventItem.tscn")
onready var container = $Scroll/Grid

func _ready():
	clear()
	visible = false

func clear():
	for i in container.get_children():
		container.remove_child(i)
		i.queue_free()

func show_inventory(inventory):
	clear()
	for i in inventory.keys():
		var count = inventory[i][0]
		for j in range (count / inventory[i][1] + 1):
			
			var new_item = item.instance()
			if count >= inventory[i][1]:
				container.add_child(new_item)
				new_item.set_item(i,count)
				count -= inventory[i][1]
				
			elif count > 0:
				container.add_child(new_item)
				new_item.set_item(i,count)
				count = 0

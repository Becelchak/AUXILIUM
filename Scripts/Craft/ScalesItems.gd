extends ScrollContainer

onready var container = $Grid/ColorRect/ItemList

func _ready():
	container.clear()
	var player = get_node("/root/PlayerData")
	for i in player.scalesItems.keys():
		var count = player.scalesItems[i][0]
		if count > 0:
			container.add_item("%s  	x%s" % [i,count])

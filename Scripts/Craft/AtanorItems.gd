extends ScrollContainer

onready var container = $Grid/ColorRect/ItemList

func _ready():
	if container != null:
		container.clear()
		var player = get_node("/root/PlayerData")
		for i in player.atanorItems.keys():
			var count = player.atanorItems[i][0]
			if count > 0:
				container.add_item("%s x%s" % [i,count])

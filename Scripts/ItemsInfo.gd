extends Control
onready var container = $Plashka/ItemsMenu/Grid/ColorRect/Progress

func _ready():
	if container != null:
		container.clear()
		var player = get_node("/root/PlayerData")
		for i in player.main_quest.size():
			var item = player.main_quest[i][0]
			var completed = ""
			if player.main_quest[i][1] > 0:
				completed = "Сделан"
			else:
				completed = "Не сделан"
			container.add_item("%s-%s" % [item,completed])

extends CanvasLayer

onready var popup = $Attention
onready var loc = $Locations

func _ready():
	pass

func close_popup():
	popup.visible = false

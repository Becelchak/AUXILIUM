extends CanvasLayer

onready var popup = $Attention

func _ready():
	pass

func close_popup():
	popup.visible = false

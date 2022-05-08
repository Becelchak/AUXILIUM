extends Control

onready var button = $Return

func _ready():
	button.connect("pressed", self, "close_menu", [button])

func close_menu(button):
	self.visible = false

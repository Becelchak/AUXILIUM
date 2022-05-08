extends Control

onready var retur = $Panel/Buttons/Continue
onready var setting = $Panel/Buttons/Setting
onready var exit = $Panel/Buttons/Exit

func _ready():
	for button in $Panel/Buttons.get_children():
		button.connect("pressed",self,"toggle_menu", [button])

func toggle_menu(button):
	if button == retur:
		get_node("/root/Ui/GameMenu").visible = false
	elif button == setting:
		$Setting.visible = true
	elif button == exit:
		get_tree().quit()

extends Popup
onready var button = $Button
var path_next = "f"

func _ready():
	pass

func change_scene(path):
	SceneChanger.change_scene(path)
	get_parent().close_popup()

#func set_next_scene(path):
	button.set_next_scene(path)

func path_next(path):
	path_next = path
	button.connect("pressed", self, "change_scene", [path_next])

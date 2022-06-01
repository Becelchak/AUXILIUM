extends Popup
onready var button = $Button
var next_scene = ""

func _ready():
	pass

func change_scene(path):
	SceneChanger.change_scene(path)
	get_parent().close_popup()
	button.disconnect("pressed", self, "change_scene")

func path_next(path):
	next_scene = path
	button.connect("pressed", self, "change_scene", [next_scene])

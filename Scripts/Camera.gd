extends Camera2D

onready var zoomfactor = 1
onready var zoomspeed = 0.750
onready var zoomstep = 0.05
onready var factorsteep = 0.01

func _ready():
	pass 
func _process(delta):
	
	zoom.x = lerp(zoom.x, zoomfactor * zoom.x, zoomspeed * delta)
	zoom.y = lerp(zoom.y, zoomfactor * zoom.y, zoomspeed * delta)
	
	zoom.x = clamp(zoom.x, 1, 2)
	zoom.y = clamp(zoom.y, 1, 2)
	
	if zoomfactor > 1:
		zoomfactor -= factorsteep
	elif zoomfactor < 1:
		zoomfactor += factorsteep

func _input(event):
	if(event) is InputEventMouseButton:
		
		if event.button_index == BUTTON_WHEEL_UP:
			zoomfactor -= zoomstep
		
		elif event.button_index == BUTTON_WHEEL_DOWN:
			zoomfactor += zoomstep

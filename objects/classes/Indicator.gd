extends Label
class_name Indicator

@export var enabled: bool = true: set = set_enabled

# Called when the node enters the scene tree for the first time.
func _ready():
	start()


func is_valid():
	return false


func start():
	if enabled and is_valid():
		set_process(true)
	else:
		enabled = false
		set_process(false)
	
	show()
	
	if !enabled:
		hide()

func _process(delta):
	pass

func set_enabled(value):
	enabled = value
	start()

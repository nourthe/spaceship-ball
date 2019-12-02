extends Label
class_name Indicator

export(bool) var enabled = true setget set_enabled


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


func set_enabled(value):
	enabled = value
	start()


func _process(delta):
	pass#set_text("%s: %s" % [label, str(get_node(target).position)])

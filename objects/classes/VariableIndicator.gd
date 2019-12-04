extends Indicator
class_name VariableIndicator

export(String) var label
export(NodePath) var target_path setget set_target
export(String) var variable_name

var target

func _ready():
	update_target()

func set_target(path):
	target_path = path
	update_target()

func update_target():
	target = get_node(target_path)

func get_target_var():
	pass

func _process(delta):
	set_text("%s: %s" % [label, get_target_var() ])
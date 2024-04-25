extends Indicator
class_name VariableIndicator

@export var label: String
@export var target_path: NodePath: set = set_target
@export var variable_name: String

var target

func _ready():
	update_target()

func set_target(path):
	target_path = path
	update_target()

func update_target():
	print(self.get_node("../../"))
	target = self.get_node(target_path)

func get_target_var():
	pass

func _process(delta):
	set_text("%s: %s" % [label, get_target_var() ])
extends VariableIndicator
class_name PositionIndicator


func is_valid():
	return get_node(target_path) is Node2D


func get_target_var():
	return "%d, %d" % [target.position.x, target.position.y]
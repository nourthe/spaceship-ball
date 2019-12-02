extends VariableIndicator
class_name VectorIndicator

func is_valid():
	return get_node(target_path).has_method("get_direction")

func get_target_var():
	var dir = target.get_direction()
	return "%f, %f" % [dir.x, dir.y]
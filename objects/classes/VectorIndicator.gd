extends VariableIndicator
class_name VectorIndicator

func is_valid():
	return get_node(target_path).has_method("get_"+str(variable_name))

func get_target_var():
	var dir = target.call("get_"+str(variable_name))
	return "%f, %f" % [dir.x, dir.y]
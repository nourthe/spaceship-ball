extends VariableIndicator
class_name RigidVelocityIndicator

func is_valid():
	return get_node(target_path) is RigidBody2D

func get_target_var():
	return "%d, %d" % [target.linear_velocity.x, target.linear_velocity.y]
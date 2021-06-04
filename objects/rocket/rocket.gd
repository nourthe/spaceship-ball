extends RigidBody2D

var aceleration = Vector2(800, 1300)
var boost = 1.8
var mbounce = 2#.16

export(float) var camera_zoom = 0.8


func get_direction():
	return Vector2(
		Input.get_action_strength("pj1-right")-Input.get_action_strength("pj1-left"),
		Input.get_action_strength("pj1-up")-Input.get_action_strength("pj1-down")
		)


func _physics_process(delta):
	var dir = get_dir()
	var vel = dir * aceleration * delta
	apply_central_impulse(vel)
	
	for bodie in get_colliding_bodies():
		var obj = bodie
		var pos = bodie.get_global_position()
		if obj.has_method("get_name") :
			on_body_entered(obj, pos)
	
	$camara.offset = $camara.offset.linear_interpolate(linear_velocity / 3, 0.01)
	var aux = (linear_velocity.length()/1000 + 1) * camera_zoom
	$camara.zoom = lerp( $camara.zoom, Vector2(1,1)*aux, 0.02)


func get_dir():
	var dir = Vector2()
	if Input.is_action_pressed("pj1-right"):
		dir.x += Input.get_action_strength("pj1-right") 
	if Input.is_action_pressed("pj1-left"):
		dir.x -= Input.get_action_strength("pj1-left")
	if Input.is_action_pressed("pj1-up"):
		dir.y -= Input.get_action_strength("pj1-up")
	if Input.is_action_pressed("pj1-down"):
		dir.y += Input.get_action_strength("pj1-down")
	
	if Input.is_action_pressed("pj1-boost"):
		dir *= boost
		vestir_boost(dir)
	else:
		desvestir_boost()
	return dir
	
	
func vestir_boost(dir):
	$color.modulate = Color(1, 0.6, 0.6)
	
	
func desvestir_boost():
	$color.modulate = Color.white


func on_body_entered(body, pos):
	if body.name == "ball":
		var force = pos - self.get_global_position()
		#body.apply_central_impulse( force * (linear_velocity.normalized()-body.linear_velocity.normalized()).length() * mbounce)

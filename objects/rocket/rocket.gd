extends KinematicBody2D

var aceleration = 350
var bounce = 100

func _ready():
	pass
func _physics_process(delta):
	var dir = get_dir()
	
	var col = move_and_collide( dir * aceleration * delta )
#	if col:
#		if col.collider.has_method("apply_impulse"):
#			col.collider.apply_impulse(Vector2(0,-50))

func get_dir():
	var dir = Vector2()
	if Input.is_action_pressed("ui_right"):
		dir.x += Input.get_action_strength("ui_right")
	if Input.is_action_pressed("ui_left"):
		dir.x -= Input.get_action_strength("ui_left")
	if Input.is_action_pressed("ui_up"):
		dir.y -= Input.get_action_strength("ui_up")
	if Input.is_action_pressed("ui_down"):
		dir.y += Input.get_action_strength("ui_down")
	return dir
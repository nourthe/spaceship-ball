extends CollisionObject2D
class_name VisibleCollisionObject

@export var color: Color

func _ready():
	for child in get_children():
		if child is CollisionPolygon2D:
			var color = Polygon2D.new()
			color.position = child.position
			add_child(color)
			
			color.polygon = child.polygon
			color.color = self.color

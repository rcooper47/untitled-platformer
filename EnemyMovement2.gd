extends StaticBody2D

const speed = 30
var value = randf_range(-1, 1)
var direction = Vector2(-1,0).normalized()

func _ready():
	pass

func _physics_process(delta):
	position += direction * speed * delta

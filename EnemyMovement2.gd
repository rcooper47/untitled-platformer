extends StaticBody2D

var speed = 150
var velocity = Vector2()
var direction = -1

func _ready():
	pass


func start(pos, dir):
	position = pos
	velocity = Vector2(speed, 0)
	
func _physics_process(delta):
	velocity.x = speed * direction
	var space_state = get_world_2d().direct_space_state
	var ray_cast_area = PhysicsRayQueryParameters2D.create(transform.origin, Vector2(1, 0))
	print(transform.get_origin())
	ray_cast_area.exclude = [self]
	var x_collision_happened = space_state.intersect_ray(ray_cast_area)
	
	if x_collision_happened:
		print("ouch")
		if x_collision_happened.collider.name == "GroundBody":
			direction *= -1
			velocity.x = speed * direction
		elif x_collision_happened.collider.name == "PlayerBody2D":
			print("Death to the PC!")
	
		
	var collide = move_and_collide(velocity * delta)

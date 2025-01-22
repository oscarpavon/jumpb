extends Area3D

var center_pos = Vector3()
var size = Vector3()
var position_in_area = Vector3()

var spawn = preload("res://spawn_sphere.tscn")

var spawned = false
func _on_ready():
	center_pos = self.position
	

func _process(delta):
	if spawned:
		#print("no spawn sphere")
		return
	else:
		spawned = true
		add_sphere()
		await get_tree().create_timer(1.0).timeout # wait for 1 second
		spawned = false
		
func add_sphere():
	size = $CollisionShape3D.shape.size
	#print(size)
	position_in_area.x = (randi() % int(size.x)) - (size.x/2) + center_pos.x
	position_in_area.y = (randi() % int(size.y)) - (size.y/2) + center_pos.y
	position_in_area.z = (randi() % int(size.z)) - (size.z/2) + center_pos.z
	
	var random_scale = randf_range(0.1,1.5)
	
	var instance = spawn.instantiate()
	instance.position = position_in_area
	instance.scale.x = random_scale
	instance.scale.y = random_scale
	instance.scale.z = random_scale
	
	add_child(instance)
	

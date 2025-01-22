extends Node3D
var random_time = 0.1
func _ready():
	random_time = randf_range(0.2,7)
	#print(random_time)
	
func _process(delta):
	
	await get_tree().create_timer(random_time).timeout # wait for 1 second
	self.queue_free()
	

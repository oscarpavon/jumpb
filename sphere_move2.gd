extends Node3D
var if_right = false
func _physics_process(delta):
	if if_right == false:
		if self.position.z > -49.369:
			self.position.z = self.position.z - (3 * delta)
		else:
			if_right = true
	
	if if_right == true:
		if self.position.z < -15.847:
			self.position.z = self.position.z + (3 * delta)
		else:
			if_right = false

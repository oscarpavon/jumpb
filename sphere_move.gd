extends Node3D
var if_right = false
func _physics_process(delta):
	if if_right == false:
		if self.position.x < 5:
			self.position.x = self.position.x + (3 * delta)
		else:
			if_right = true
	
	if if_right == true:
		if self.position.x > -5:
			self.position.x = self.position.x - (3 * delta)
		else:
			if_right = false

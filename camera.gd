extends Node3D

var cam_rot_h = 0
var cam_rot_v = 0


func _input(event):
	if event is InputEventMouseMotion:
		cam_rot_h += -event.relative.x
		cam_rot_v -= event.relative.y
		
func _physics_process(delta):
	$h.rotation_degrees.y = cam_rot_h
	$h/v.rotation_degrees.x = cam_rot_v

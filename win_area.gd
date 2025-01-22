extends Area3D
@onready var player = $"../Player"
func _ready():
	body_entered.connect(_on_body_entered)
	
func _on_body_entered(body):
	if body == player:
		print("you won")
		get_tree().create_timer(1.0).timeout
		get_tree().change_scene_to_file("res://levels/level2.tscn")

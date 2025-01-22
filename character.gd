extends CharacterBody3D

# How fast the player moves in meters per second.
@export var speed = 14
# The downward acceleration when in the air, in meters per second squared.
@export var fall_acceleration = 75

var target_velocity = Vector3.ZERO
@export var jump_impulse = 20

@export var start_position = Vector3()

func _physics_process(delta):
	var direction = Vector3.ZERO

	if Input.is_action_pressed("move_right"):
		direction.x += 1
	if Input.is_action_pressed("move_left"):
		direction.x -= 1
	if Input.is_action_pressed("move_back"):
		direction.z += 1
	if Input.is_action_pressed("move_forward"):
		direction.z -= 1
		
	if is_on_floor() and Input.is_action_just_pressed("jump"):
		target_velocity.y = jump_impulse



		
	if direction != Vector3.ZERO:
		direction = direction.normalized()
		$Pivot.basis = Basis.looking_at(direction)
		$Pivot/character2/AnimationTree.set("parameters/Blend2/blend_amount",1)
	else:
		$Pivot/character2/AnimationTree.set("parameters/Blend2/blend_amount",0)

	# Ground Velocity
	
	#var relativeDir = Vector3(direction.x, 0.0, direction.z).rotated(Vector3.UP, $Camroot/h/v/SpringArm3D.rotation.y)
	
	target_velocity.x = direction.x * speed
	target_velocity.z = direction.z * speed
	
	#target_velocity.x = relativeDir.x * speed
	#target_velocity.z = relativeDir.z * speed
	
	# Vertical Velocity
	if not is_on_floor(): # If in the air, fall towards the floor. Literally gravity
		target_velocity.y = target_velocity.y - (fall_acceleration * delta)
		$Pivot/character2/AnimationTree.set("parameters/Blend_jump/blend_amount",1)
	else:
		$Pivot/character2/AnimationTree.set("parameters/Blend_jump/blend_amount",0)

	# Moving the Character
	velocity = target_velocity
	move_and_slide()
	
	
	if self.global_position.y < -40:
		self.position = start_position
		print("you lose")
	
	

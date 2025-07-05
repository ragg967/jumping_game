extends CharacterBody2D

@export var speed: float = 300.0
@export var jumpVelocity: float = -500.0
var inputLeft: StringName = &"moveLeft"
var inputRight: StringName = &"moveRight"
var inputJump: StringName = &"jump"
var inputDown: StringName = &"dashDown"


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

		# Handle jump.

		# Get the input direction and handle the movement/deceleration.
		# As good practice, you should replace UI actions with custom gameplay actions.
	if Input.is_action_just_pressed(inputJump) and is_on_floor():
		velocity.y = jumpVelocity

		# Get the input direction and handle the movement/deceleration.
		# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis(inputLeft, inputRight)
	if direction:
		velocity.x = direction * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)

	if Input.is_action_just_pressed(inputDown):
		velocity.y += 500

	move_and_slide()

extends CharacterBody2D

@export var speed: float = 300.0
@export var jumpVelocity: float = -500.0
var isDead: bool = false


func _physics_process(delta: float) -> void:
	if !isDead:
		Engine.time_scale = 1
		# Add the gravity.
		if not is_on_floor():
			velocity += get_gravity() * delta

		# Handle jump.
		if Input.is_action_just_pressed(&"jump") and is_on_floor():
			velocity.y = jumpVelocity

		# Get the input direction and handle the movement/deceleration.
		# As good practice, you should replace UI actions with custom gameplay actions.
		var direction := Input.get_axis(&"moveLeft", &"moveRight")
		if direction:
			velocity.x = direction * speed
		else:
			velocity.x = move_toward(velocity.x, 0, speed)

		move_and_slide()
	else:
		Engine.time_scale = 0

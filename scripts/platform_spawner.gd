extends Node2D

const PLATFORM: PackedScene = preload("res://scenes/platform.tscn")
@onready var scoreBoard: RichTextLabel = get_node("../Score board/RichTextLabel")
@onready var speedTimer: Timer = $SpeedTimer
@onready var spawnTimer: Timer = $SpawnTimer
var platformSpeed: int = -100
var timerTicks: int = 0


func _process(_delta: float) -> void:
	var old_wait_time = speedTimer.wait_time
	var old_speed = platformSpeed

	# Update spawn rate and speed based on score
	match scoreBoard.score:
		1:
			speedTimer.wait_time = randf_range(4.5, 5)
			platformSpeed = randi_range(-100, -150)
		5:
			speedTimer.wait_time = randf_range(4, 4.5)
			platformSpeed = randi_range(-100, -300)
		15:
			speedTimer.wait_time = randf_range(3.5, 4)
			platformSpeed = randi_range(-150, -400)
		25:
			speedTimer.wait_time = randf_range(3, 3.5)
			platformSpeed = randi_range(-200, -500)
		35:
			speedTimer.wait_time = randf_range(2.5, 3)
			platformSpeed = randi_range(-250, -600)
		45:
			speedTimer.wait_time = randf_range(2, 2.5)
			platformSpeed = randi_range(-300, -700)
		55:
			speedTimer.wait_time = randf_range(1.5, 2)
			platformSpeed = randi_range(-350, -800)
		65:
			speedTimer.wait_time = randf_range(1, 1.5)
			platformSpeed = randi_range(-400, -900)
		75:
			speedTimer.wait_time = randf_range(0.5, 1)
			platformSpeed = randi_range(-450, -1000)

	# Restart timer if wait_time changed
	if speedTimer.wait_time != old_wait_time:
		speedTimer.start()


func _spawn_platform() -> void:
	if timerTicks <= 10:
		spawnTimer.wait_time = randi_range(6, 10)
		timerTicks += 1
		# Spawn platform and add it to the main scene, not as child of spawner
		var platformInstant: RigidBody2D = PLATFORM.instantiate()
		get_parent().add_child(platformInstant)  # Add to main scene

		# Set platform position and velocity
		platformInstant.global_position = Vector2(global_position.x, randf_range(-300, 300))
		platformInstant.linear_velocity = Vector2(platformSpeed, 0)
	else:
		spawnTimer.stop()

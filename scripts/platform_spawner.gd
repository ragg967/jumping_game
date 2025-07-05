extends Node

const PLATFORM: PackedScene = preload("res://scenes/platform.tscn")
@onready var scoreBoard: RichTextLabel = get_node("/root/main/Score board/RichTextLabel")
@onready var timer: Timer = $Timer
var platformsSpawned: int = 0
var baseWaitTime: float = 2.5
var baseSpeed: float = -75.0


func _ready() -> void:
	update_difficulty()


func _process(_delta: float) -> void:
	pass


func _spawn_platform() -> void:
	var platformInstant := PLATFORM.instantiate()
	add_child(platformInstant)
	platformsSpawned += 1
	platformInstant.global_position.y = randf_range(-250, 250)
	platformInstant.linear_velocity.x = get_current_speed()
	update_difficulty()


func update_difficulty() -> void:
	var score = GameManager.score

	# Aggressive difficulty scaling based on score
	var difficulty_multiplier = 1.0 + (score * 0.12)  # 12% increase per point

	# Calculate spawn rate (gets faster over time)
	var spawn_interval = baseWaitTime / difficulty_multiplier
	spawn_interval = max(spawn_interval, 0.15)  # Minimum 0.15 seconds between spawns

	# Add some randomness to spawn timing
	var min_time = spawn_interval * 0.8
	var max_time = spawn_interval * 1.2
	timer.wait_time = randf_range(min_time, max_time)


func get_current_speed() -> float:
	var score = GameManager.score
	var difficulty_multiplier = 1.0 + (score * 0.18)  # 18% speed increase per point

	var current_speed = baseSpeed * difficulty_multiplier
	# Higher max speed cap for more challenge
	current_speed = max(current_speed, -600.0)

	# Increased speed variance for unpredictability
	var speed_variance = abs(current_speed) * 0.25
	return randf_range(current_speed - speed_variance, current_speed + speed_variance)

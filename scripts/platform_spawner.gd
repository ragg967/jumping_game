extends Node

const PLATFORM: PackedScene = preload("res://scenes/platform.tscn")
@onready var scoreBoard: RichTextLabel = get_node("/root/main/Score board/RichTextLabel")
@onready var timer: Timer = $Timer
@onready var platformSpawner: StaticBody2D = self.get_node("StaticBody2D")

var platformPool: Array[RigidBody2D] = []
var activePlatforms: Array[RigidBody2D] = []
var platformsSpawned: int = 0
var platformSpeeds: int = randi_range(-50, -100)
var poolSize: int = 10
var rightSpawnX: float = 728.0
var leftDespawnX: float = -856.0


func _ready() -> void:
	# Create platform pool
	for i in range(poolSize):
		var platform := PLATFORM.instantiate()
		add_child(platform)
		platform.position.x = rightSpawnX + 300 + (i * 100)  # Start offscreen
		platform.position.y = -1000  # Start way off screen
		platform.linear_velocity = Vector2.ZERO
		platformPool.append(platform)


func _process(_delta: float) -> void:
	# Check for platforms that need to be recycled
	for platform in activePlatforms.duplicate():
		if platform.global_position.x <= leftDespawnX:
			recyclePlatform(platform)


func _spawn_platform() -> void:
	if platformPool.size() > 0:
		var platform = platformPool.pop_back()
		activePlatforms.append(platform)

		platformsSpawned += 1
		platform.global_position.x = rightSpawnX
		platform.global_position.y = randi_range(
			platformSpawner.global_position.y - 62.5, platformSpawner.global_position.y + 62.5
		)
		platform.linear_velocity.x = platformSpeeds
		platform.linear_velocity.y = 0

		scoreBoard.score += 0.25
		update_difficulty()


func recyclePlatform(platform: RigidBody2D) -> void:
	activePlatforms.erase(platform)
	platformPool.append(platform)

	# Move platform offscreen and stop it
	platform.position.x = rightSpawnX + 300
	platform.position.y = -1000
	platform.linear_velocity = Vector2.ZERO


func update_difficulty() -> void:
	match platformsSpawned:
		1:
			timer.wait_time = randf_range(4.5, 5)
		5:
			timer.wait_time = randf_range(4, 4.5)
			platformSpeeds = randi_range(-150, -250)
		15:
			timer.wait_time = randf_range(3.5, 4)
			platformSpeeds = randi_range(-200, -300)
		25:
			timer.wait_time = randf_range(3, 3.5)
			platformSpeeds = randi_range(-250, -350)
		35:
			timer.wait_time = randf_range(2.5, 3)
			platformSpeeds = randi_range(-300, -400)
		45:
			timer.wait_time = randf_range(2, 2.5)
			platformSpeeds = randi_range(-350, -450)
		55:
			timer.wait_time = randf_range(1.5, 2)
			platformSpeeds = randi_range(-400, -500)
		65:
			timer.wait_time = randf_range(1, 1.5)
			platformSpeeds = randi_range(-450, -550)
		75:
			timer.wait_time = randf_range(0.5, 1)
			platformSpeeds = randi_range(-500, -600)

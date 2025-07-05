extends Node

const PLATFORM: PackedScene = preload("res://scenes/platform.tscn")
@onready var scoreBoard: RichTextLabel = get_node("/root/main/Score board/RichTextLabel")
@onready var timer: Timer = $Timer
@onready var platformSpawner: StaticBody2D = self.get_node("StaticBody2D")
var platformsSpawned: int = 0
var platformSpeeds: int = randi_range(-50, -100)


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _spawn_platform() -> void:
	var platformInstant := PLATFORM.instantiate()
	add_child(platformInstant)
	platformsSpawned += 1
	platformInstant.global_position.y = randi_range(
		platformSpawner.global_position.y - 62.5, platformSpawner.global_position.y + 62.5
	)
	platformInstant.linear_velocity.x = platformSpeeds
	scoreBoard.score += .25
	_update_difficulty()


func _update_difficulty() -> void:
	match platformsSpawned:
		1:
			timer.wait_time = 5
		2:
			timer.wait_time = randf_range(4.5, 5)
		5:
			timer.wait_time = randf_range(4, 4.5)
			platformSpeeds = randi_range(-75, -125)
		15:
			timer.wait_time = randf_range(3.5, 4)
			platformSpeeds = randi_range(-100, -150)
		25:
			timer.wait_time = randf_range(3, 3.5)
			platformSpeeds = randi_range(-125, -175)
		35:
			timer.wait_time = randf_range(2.5, 3)
			platformSpeeds = randi_range(-150, -200)
		45:
			timer.wait_time = randf_range(2, 2.5)
			platformSpeeds = randi_range(-175, -225)
		55:
			timer.wait_time = randf_range(1.5, 2)
			platformSpeeds = randi_range(-200, -250)
		65:
			timer.wait_time = randf_range(1, 1.5)
			platformSpeeds = randi_range(-225, -275)
		75:
			timer.wait_time = randf_range(0.5, 1)
			platformSpeeds = randi_range(-250, -300)

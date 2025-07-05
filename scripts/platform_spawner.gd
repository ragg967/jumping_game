extends Node

const PLATFORM: PackedScene = preload("res://scenes/platform.tscn")
@onready var scoreBoard: RichTextLabel = get_node("/root/main/Score board/RichTextLabel")
@onready var timer: Timer = $Timer
var platformsSpawned: int = 0
var platformSpeed: float = randf_range(-50, -100)


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
	platformInstant.global_position.y = randf_range(-250, 250)
	platformInstant.linear_velocity.x = platformSpeed
	scoreBoard.score += 1
	update_difficulty()


func update_difficulty() -> void:
	match platformsSpawned:
		1:
			timer.wait_time = randf_range(4.5, 5)
		5:
			timer.wait_time = randf_range(4, 4.5)
			platformSpeed = randf_range(-100, -300)
		15:
			timer.wait_time = randf_range(3.5, 4)
			platformSpeed = randf_range(-150, -400)
		25:
			timer.wait_time = randf_range(3, 3.5)
			platformSpeed = randf_range(-200, -500)
		35:
			timer.wait_time = randf_range(2.5, 3)
			platformSpeed = randf_range(-250, -600)
		45:
			timer.wait_time = randf_range(2, 2.5)
			platformSpeed = randf_range(-300, -700)
		55:
			timer.wait_time = randf_range(1.5, 2)
			platformSpeed = randf_range(-350, -800)
		65:
			timer.wait_time = randf_range(1, 1.5)
			platformSpeed = randf_range(-400, -900)
		75:
			timer.wait_time = randf_range(0.5, 1)
			platformSpeed = randf_range(-450, -1000)

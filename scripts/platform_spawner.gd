extends Node

const PLATFORM: PackedScene = preload("res://scenes/platform.tscn")
@onready var scoreBoard: RichTextLabel = get_node("/root/main/Score board/RichTextLabel")
@onready var timer: Timer = $Timer
var platformsSpawned: int = 0
var platformSpeed: float = randf_range(-50, -100)


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	timer.wait_time = randf_range(1, 3)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _spawn_platform() -> void:
	var platformInstant := PLATFORM.instantiate()
	add_child(platformInstant)
	platformsSpawned += 1
	platformInstant.global_position.y = randf_range(-250, 250)
	platformInstant.linear_velocity.x = platformSpeed
	update_difficulty()


func update_difficulty() -> void:
	match scoreBoard.score:
		1:
			timer.wait_time = randf_range(2.8, 3.2)
			platformSpeed = randf_range(-80, -120)
		10:
			timer.wait_time = randf_range(2.4, 2.8)
			platformSpeed = randf_range(-100, -150)
		20:
			timer.wait_time = randf_range(2.0, 2.4)
			platformSpeed = randf_range(-120, -180)
		30:
			timer.wait_time = randf_range(1.6, 2.0)
			platformSpeed = randf_range(-140, -210)
		40:
			timer.wait_time = randf_range(1.2, 1.6)
			platformSpeed = randf_range(-160, -240)
		50:
			timer.wait_time = randf_range(0.8, 1.2)
			platformSpeed = randf_range(-180, -270)
		60:
			timer.wait_time = randf_range(0.6, 1.0)
			platformSpeed = randf_range(-200, -300)
		70:
			timer.wait_time = randf_range(0.4, 0.8)
			platformSpeed = randf_range(-220, -330)
		80:
			timer.wait_time = randf_range(0.3, 0.6)
			platformSpeed = randf_range(-240, -360)

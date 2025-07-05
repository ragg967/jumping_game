extends Node

const PLATFORM: PackedScene = preload("res://scenes/platform.tscn")
@onready var scoreBoard: RichTextLabel = get_node("/root/main/Score board/RichTextLabel")
@onready var timer: Timer = $Timer
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
	platformInstant.global_position.y = randi_range(-250, 250)
	platformInstant.linear_velocity.x = platformSpeeds
	scoreBoard.score += 1
	_change_timer_duration()


func _change_timer_duration() -> void:
	match platformsSpawned:
		1:
			timer.wait_time = 5
		5:
			timer.wait_time = 4.5
			platformSpeeds = randi_range(-75, -125)
		15:
			timer.wait_time = 4
			platformSpeeds = randi_range(-100, -150)
		25:
			timer.wait_time = 3.5
			platformSpeeds = randi_range(-125, -175)
		35:
			timer.wait_time = 3
			platformSpeeds = randi_range(-150, -200)
		45:
			timer.wait_time = 2.5
			platformSpeeds = randi_range(-175, -225)
		55:
			timer.wait_time = 2
			platformSpeeds = randi_range(-200, -250)
		65:
			timer.wait_time = 1.5
			platformSpeeds = randi_range(-225, -275)
		75:
			timer.wait_time = 1
			platformSpeeds = randi_range(-250, -300)

extends Control

var restart: StringName = &"restart"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	GameManager.gameOver.connect(make_visible)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if visible and Input.is_action_pressed(restart):
		GameManager.restart_game()


func make_visible():
	visible = true

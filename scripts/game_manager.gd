extends Node

var score: int = 0
var isGameOver: bool = false
signal gameOver


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func game_over():
	gameOver.emit()
	Engine.time_scale = 0


func restart_game():
	get_tree().change_scene_to_file("res://scenes/main.tscn")
	Engine.time_scale = 1
	score = 0


func update_score(amount: int = 1):
	if !isGameOver:
		score += amount

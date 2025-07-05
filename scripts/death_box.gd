extends Area2D

var restart: StringName = &"restart"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_body_entered(body: CharacterBody2D) -> void:
	if body.is_in_group("Player"):
		GameManager.game_over()

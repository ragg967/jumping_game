extends Area2D

@onready var player: CharacterBody2D = get_node("../Player")
@onready var deathMenu: Control = get_node("../Death menu")


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		player.isDead = true
		deathMenu.isVisible = true

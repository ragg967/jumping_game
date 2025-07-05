extends Node2D

# Get reference to the platform spawners using relative paths
@onready var platformSpawner: Node2D = get_node("../Platform spawner")


func _ready() -> void:
	pass


func _process(_delta: float) -> void:
	pass


func _on_area_2d_body_entered(body: Node2D) -> void:
	print("body entered")
	if body.is_in_group("Platform"):
		body.global_position = Vector2(platformSpawner.global_position.x, randf_range(-300, 300))
		body.linear_velocity.x = platformSpawner.platformSpeed

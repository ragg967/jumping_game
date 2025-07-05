extends Node2D

# Get reference to the platform spawner to access its recycle function
@onready var platformSpawner1: Node = get_node("/root/main/Platform spawner")
@onready var platformSpawner2: Node = get_node("/root/main/Platform spawner2")
@onready var platformSpawner3: Node = get_node("/root/main/Platform spawner3")
@onready var platformSpawner4: Node = get_node("/root/main/Platform spawner4")


func _ready() -> void:
	pass


func _process(_delta: float) -> void:
	pass


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("Platform"):
		# Instead of freeing, recycle the platform
		# Find which spawner should handle this platform
		if platformSpawner1 and platformSpawner1.has_method("recyclePlatform"):
			if body in platformSpawner1.activePlatforms:
				platformSpawner1.recyclePlatform(body)
				return
		if platformSpawner2 and platformSpawner2.has_method("recyclePlatform"):
			if body in platformSpawner2.activePlatforms:
				platformSpawner2.recyclePlatform(body)
				return
		if platformSpawner3 and platformSpawner3.has_method("recyclePlatform"):
			if body in platformSpawner3.activePlatforms:
				platformSpawner3.recyclePlatform(body)
				return
		if platformSpawner4 and platformSpawner4.has_method("recyclePlatform"):
			if body in platformSpawner4.activePlatforms:
				platformSpawner4.recyclePlatform(body)
				return

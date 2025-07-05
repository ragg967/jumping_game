extends Control

var isVisible: bool = false


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass  # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if isVisible == true:
		visible = isVisible
		if Input.is_action_just_pressed(&"restart"):
			get_tree().change_scene_to_file("res://scenes/main.tscn")
	else:
		visible = isVisible

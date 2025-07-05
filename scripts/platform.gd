extends RigidBody2D

var timer: Timer = Timer.new()


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	timer.autostart = true
	timer.wait_time = 10
	timer.connect("timeout", _on_timer_timeout)
	add_child(timer)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_timer_timeout():
	print("Current X position: %s" % global_position.x)
	printt("ID: %s" % self.get_instance_id())

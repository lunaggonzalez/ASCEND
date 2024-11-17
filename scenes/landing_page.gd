extends Node2D
var gameStarted = false;
signal startSignal(gameStarted: bool)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_pressed("ui_accept"):
		gameStarted = true
		emit_signal("startSignal", gameStarted)
		get_tree().change_scene_to_file("res://scenes/Control Panels.tscn")

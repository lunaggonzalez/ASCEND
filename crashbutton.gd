extends Button

#func _pressed():
	#get_tree().change_scene("res://camera_2d.tscn")

# Called when the node enters the scene tree for the first time.
#func _ready() -> void:
	#pass # Replace with function body.

#func _process(delta: float) -> void:
	#pass


func _on_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/area_2d.tscn")

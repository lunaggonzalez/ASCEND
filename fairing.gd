extends Sprite2D

var speed = 400
var angular_speed = PI 

func _process(delta):
	var direction = 0
	if Input.is_action_pressed("ui_2_left"):
		direction = -1
	if Input.is_action_pressed("ui_2_right"):
		direction = 1

	rotation += angular_speed * direction * delta

	var velocity = Vector2.ZERO
	if Input.is_action_pressed("ui_2_up"):
		velocity = Vector2.UP.rotated(rotation) * speed
		
	position += velocity * delta
	
	var target_position = Vector2(1200,500)
	var new_scene = ("res://landing.tscn")
	
	#position.x += speed * delta 
	
	if position.distance_to(target_position)< 10:
		get_tree().change_scene("res://landing.tscn")
	
		

	
	

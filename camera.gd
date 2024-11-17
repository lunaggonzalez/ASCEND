extends Camera2D
var speed=200

func _physics_process(delta):
	var input_vec=Input.get_vector("ul_right","ul_left","ul_up","ul_down")
	global_translate(input_vec*speed*delta)
	

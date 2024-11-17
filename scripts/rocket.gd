extends RigidBody2D

@onready var v_extra := Vector2(0,0)
const turn = float(0)
var launchstart := false
var expo = 3
var com = 40
var fuel_cost = 0
var thing = 0
var methane = 0
var oxygen = 0
var force_point = Vector2(0, -180)

func _integrate_forces(state: PhysicsDirectBodyState2D) -> void:
	thing = scale(methane, 500, 4000, 1, 3)-scale(oxygen, 500, 4000, 1, 3)
	if thing < 0:
		thing *= -1
	expo = 3 - thing
	if launchstart:
		fuel_cost += 2**expo
		if v_extra.y == 0:
			v_extra.y = -0.25
		elif v_extra.y > (-2000*(2**expo)):
			v_extra.y += v_extra.y * (1.25 * (2**expo))
		if position.y <= -2500 && force_point.x > -180:
			force_point.x -= 1
			force_point.y += 1
		if fuel_cost == methane:
			v_extra = Vector2(0,0)
		if rotation_degrees >= 90 && fuel_cost <= methane:
			rotation_degrees = 90
		if global_position.y < -8000 && state.get_velocity_at_local_position(global_position).x > 250000 && methane - fuel_cost >= 250:
			get_tree().change_scene_to_file("res://scenes/launch_win.tscn")
		print(state.get_velocity_at_local_position(global_position).x , " Rotation: ", rotation_degrees, " Fuel: ", methane - fuel_cost, " Exponent: ", expo)
	state.apply_force(v_extra, force_point)

func _on_h_slider_value_changed(value: float) -> void:
	set_center_of_mass(Vector2(0,value))


func _on_mass_value_changed(value: float) -> void:
	if value == 0:
		set_mass(1)
	else:
		set_mass(value)


func _on_methane_value_changed(value: float) -> void:
	methane = value


func _on_oxygen_value_changed(value: float) -> void:
	oxygen = value


func scale(num: float, min: float, max: float, scale_min:float, scale_max:float) -> float:
	return (((scale_max-scale_min)*(num-min))/(max-min)) + min


func _on_launch_pressed() -> void:
	launchstart = true
	print("launch!")

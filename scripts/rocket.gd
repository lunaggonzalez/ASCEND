extends RigidBody2D

@onready var v_extra := Vector2(0,0)
const turn = float(0)
var launchstart := false
var expo = 0
var com = 40

func _on_button_pressed() -> void:
	launchstart = true
	print("launch!")

func _integrate_forces(state: PhysicsDirectBodyState2D) -> void:
	if launchstart:
		if v_extra.y == 0:
			v_extra.y = -0.25
		elif v_extra.y > (-1000*(2**expo)):
			v_extra.y += v_extra.y * (1.25 * (2**expo))
		print(v_extra)
	state.apply_force(v_extra, Vector2(0, -180))


func _on_option_button_item_selected(index: int) -> void:
	expo = index


func _on_h_slider_value_changed(value: float) -> void:
	set_center_of_mass(Vector2(0,value))


func _on_weight_value_changed(value: float) -> void:
	if value == 0:
		set_mass(1)
	else:
		set_mass(value)

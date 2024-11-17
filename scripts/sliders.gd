extends Node2D

var methane;
var liquidOxygen;
var mass;
var heavyRain = false
var windspeedLaunchpad;
var windspeedUpperAtmosphere;
var lightning = false;
var temp;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass #set default values here


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float):
	methane = $VSlider
	liquidOxygen = $VSlider2
	mass = $VSlider3
	windspeedLaunchpad = $VSlider4
	windspeedUpperAtmosphere = $VSlider5
	temp = $VSlider6

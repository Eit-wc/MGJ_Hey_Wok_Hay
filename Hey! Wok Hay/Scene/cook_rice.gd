extends Control

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
    pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
    pass

@onready var h_slider: HSlider = $HSlider
@export var mapTimer:Dictionary = {"low":[15,10,5,10],"mid":[10,5,3,7],"high":[7,3,1,4]}
@export var objStage:Array[NodePath] = []
var curentHeat = "mid"
func _on_cook_button_pressed() -> void:
    var heatValue:float = h_slider.value
    print(heatValue)
    
    if heatValue < 45:
        curentHeat = "low"
    elif heatValue < 55:
        curentHeat = "mid"
    else:
        curentHeat = "high"
        
    var wokNode:TextureRect = $Wok

func _on_retry_pressed() -> void:
    get_tree().reload_current_scene()
    pass # Replace with function body.

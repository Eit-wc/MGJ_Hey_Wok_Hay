extends Control
class_name GameControl

@export var gameScore:Array[int] = [0,10,25,15,0]
@export var buttonText:Array[String] = ["Cook!","Done"]
@export var gameIndex:int = 0
@export var nextScene = ""
var currentScore:int = 0
# Called when the node enters the scene tree for the first time.
@onready var cook_button: Button = $CookButton
func _ready() -> void:
    cook_button.text = buttonText[0]
    pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
    pass

@onready var h_slider: HSlider = $HSlider
@export var mapTimer:Dictionary = {"low":[15,25,30,40],"mid":[10,15,18,25],"high":[7,10,11,15]}
var currentHeat = "notYet"

@onready var timer:Array[Timer] = [$Timer/TimerShakeLv1, $Timer/TimerShakeLv2, $Timer/TimerShakeLv3, $Timer/TimerBurn]


func _on_cook_button_pressed() -> void:
    if cook_button.text == buttonText[0]:
        $AudioStreamPlayer.play()
        var heatValue:float = h_slider.value
        print(heatValue)
        if heatValue < 45:
            currentHeat = "low"
        elif heatValue < 55:
            currentHeat = "mid"
        else:
            currentHeat = "high"
        print("Cook at %s heat"%[currentHeat])
        
        for i in range(4):
            timer[i].wait_time = float(mapTimer[currentHeat][i])
            timer[i].start()
        h_slider.editable = false
        cook_button.text = buttonText[1]
        
    elif cook_button.text == buttonText[1]:
        for i in range(4):
            timer[i].stop()
        for n in materialContainer.get_children():
            n.shakeLv = 0
        $Score.text = "Score: %s"%[currentScore]
        Global.score[gameIndex] = currentScore
        Global.heatLv[gameIndex] = h_slider.value
        cook_button.disabled = true
        
        await get_tree().create_timer(1).timeout
        print("Change Scene to: %s"%nextScene)
        get_tree().change_scene_to_file(nextScene)
    
func _on_retry_pressed() -> void:
    get_tree().reload_current_scene()
    pass # Replace with function body.

@onready var materialContainer:HBoxContainer = $Wok/DropArea/HBoxContainer
func _on_timer_shake_lv_1_timeout() -> void:
    print("Shake LV1")
    for n in materialContainer.get_children():
        n.shakeLv = 1
    currentScore = gameScore[1]
    pass # Replace with function body.


func _on_timer_shake_lv_2_timeout() -> void:
    print("Shake LV2")
    for n in materialContainer.get_children():
        n.shakeLv = 2
    currentScore = gameScore[2]
    pass # Replace with function body.


func _on_timer_shake_lv_3_timeout() -> void:
    print("Shake LV3")
    for n in materialContainer.get_children():
        n.shakeLv = 3
    currentScore = gameScore[3]
    pass # Replace with function body.


func _on_timer_burn_timeout() -> void:
    print("Burn")
    for n in materialContainer.get_children():
        n.shakeLv = 4
    currentScore = gameScore[4]
    pass # Replace with function body.

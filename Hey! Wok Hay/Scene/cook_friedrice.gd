extends Control
class_name GameControlFryRice

@export var buttonText:Array[String] = ["Cook!","Wok hay!"]
@export var gameIndex:int = 2
@export var nextScene = ""
var currentScore:int = 0
# Called when the node enters the scene tree for the first time.
@onready var cook_button: Button = $CookButton
@onready var time: Label = $Time

@export var countDownTimer:int = 20
var timer:Timer = Timer.new()
var eventTimer:Timer = Timer.new()
func _ready() -> void:
    time.text = "00:%02d" %countDownTimer 
    cook_button.text = buttonText[0]
    timer.one_shot = false
    timer.wait_time = 1
    timer.timeout.connect(oneSecInterrupt)
    add_child(timer)
    
    eventTimer.timeout.connect(eventTimerInterrupt)
    add_child(eventTimer)
    pass # Replace with function body.

@onready var scoreLabel: Label = $Score

func oneSecInterrupt():
    countDownTimer-=1
    if countDownTimer <= 0:
        # ============= End Game ==================
        timer.stop()
        eventTimer.stop()
        cook_button.disabled = true
        
        var score =  roundi(score_bar.value/100 * 50)
        scoreLabel.text = "Score: %s"%score
        Global.score[gameIndex] = score
        Global.heatLv[gameIndex] = h_slider.value
        time.text = "00:%02d" %countDownTimer
        await get_tree().create_timer(2).timeout  
        
        var totalScore:float = 0
        for s in Global.score:
            totalScore += s
            
        if totalScore <50:
            get_tree().change_scene_to_file("res://Scene/sad_fried_rice.tscn")
            pass
        elif totalScore <80:
            get_tree().change_scene_to_file("res://Scene/yummy.tscn")
            pass
        else:
            get_tree().change_scene_to_file("res://Scene/perfect.tscn")
            pass
          
    time.text = "00:%02d" %countDownTimer
    pass

@onready var wok_bar: ProgressBar = $WokBar

func eventTimerInterrupt():
    var duration = randf_range(0.3,1.5)/heatScale
    var targetProp = randfn(72.5,15)
    var tw:Tween = get_tree().create_tween().set_trans(Tween.TRANS_CUBIC)
    tw.tween_property(wok_bar,"value",targetProp,duration)
    
    eventTimer.wait_time = duration
    eventTimer.start()
    pass

var scoreSpeedScale:float = 14.0
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
    if cook_button.text != buttonText[1]:
        return
    if cook_button.button_pressed and 60<wok_bar.value and wok_bar.value<80:
        score_bar.value+=delta*scoreSpeedScale
    elif cook_button.button_pressed:
        score_bar.value-=delta*scoreSpeedScale*2
    pass

@onready var h_slider: HSlider = $HSlider
@export var mapTimer:Dictionary = {"low":0.8,"mid":1,"high":2}
var heatScale:float = 1
var currentHeat = "notYet"

func _on_cook_button_pressed() -> void:
    if cook_button.text == buttonText[0]:
        var heatValue:float = h_slider.value
        print(heatValue)
        if heatValue < 45:
            currentHeat = "low"
        elif heatValue < 55:
            currentHeat = "mid"
        else:
            currentHeat = "high"
        print("Cook at %s heat"%[currentHeat])
        Global.playSFX("res://audio/click_feedback_positive.wav")
        $AudioStreamPlayer.play()
        _setShakeLV(1)
        timer.start()
        heatScale = mapTimer[currentHeat]
        eventTimerInterrupt()
        $GuideLabel.visible = true
        h_slider.editable = false
        cook_button.text = buttonText[1]
    
func _on_retry_pressed() -> void:
    Global.playSFX("res://audio/click_feedback_negative.wav")
    get_tree().reload_current_scene()
    pass # Replace with function body.

@onready var materialContainer:HBoxContainer = $Wok/DropArea/HBoxContainer
func _setShakeLV(lv:int):
    for n in materialContainer.get_children():
        n.shakeLv = lv

@onready var score_bar: ProgressBar = $ScoreBar
func _on_cook_button_button_down() -> void:
    if cook_button.text != buttonText[1]:
        return
    if 60<wok_bar.value and wok_bar.value<80:
        score_bar.value+=1
    pass # Replace with function body.

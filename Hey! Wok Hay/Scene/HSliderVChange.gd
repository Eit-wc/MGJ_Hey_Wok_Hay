extends HSlider


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
    pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
    pass
@onready var frameList:Array[TextureRect] = [$"../Wok/FLow", $"../Wok/FMid", $"../Wok/FHigh"]
func setFrameLv(lv:int):
    for i in range(3):
        frameList[i].visible = (lv == i)

@onready var soundPlayer:Array[AudioStreamPlayer] = [$Low/AudioStreamPlayer, $Mid/AudioStreamPlayer, $High/AudioStreamPlayer]
func _on_value_changed(value: float) -> void:
    if value< 45:
        setFrameLv(0)
        soundPlayer[0].play()
    elif value<55:
        setFrameLv(1)
        soundPlayer[1].play()
    else:
        setFrameLv(2)
        soundPlayer[2].play()
    pass # Replace with function body.

extends HSlider


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
    pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
    pass

@onready var soundPlayer:Array[AudioStreamPlayer] = [$Low/AudioStreamPlayer, $Mid/AudioStreamPlayer, $High/AudioStreamPlayer]
func _on_value_changed(value: float) -> void:
    if value< 45:
        soundPlayer[0].play()
    elif value<55:
        soundPlayer[1].play()
    else:
        soundPlayer[2].play()
    pass # Replace with function body.

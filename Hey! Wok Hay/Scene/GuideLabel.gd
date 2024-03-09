extends Label

@onready var wok_bar: ProgressBar = $"../WokBar"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
    pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
    if 60<wok_bar.value and wok_bar.value< 80:
        text = "Hold!"
    else:
        text = "Don't push"
    pass

extends Button

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
    pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
    pass

func _on_pressed() -> void:
    Global.playSFX("res://audio/click_feedback_negative.wav")
    get_tree().change_scene_to_file("res://Scene/StartMenu.tscn")
    pass # Replace with function body.

extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
    pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
    pass

func _on_start_pressed() -> void:
    Global.playSFX("res://audio/click_feedback_positive.wav")
    get_tree().change_scene_to_file("res://Scene/cook_rice.tscn")
    pass # Replace with function body.

func _on_quit_pressed() -> void:
    Global.playSFX("res://audio/click_feedback_negative.wav")
    get_tree().quit()
    pass # Replace with function body.

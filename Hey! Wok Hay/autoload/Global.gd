extends Node

#rice, sausage, fry
var score:Array[float] = [0,0,0]
var heatLv:Array[float] = [0,0,0]

func _ready() -> void:
    var themeMusicNode = preload("res://assets/MusicAssets/theme_music.tscn").instantiate()
    add_child(themeMusicNode)
    pass


func _process(delta: float) -> void:
    pass

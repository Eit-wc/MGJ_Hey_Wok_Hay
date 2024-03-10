extends Node

#rice, sausage, fry
var score:Array[float] = [0,0,0]
var heatLv:Array[float] = [0,0,0]

var themeMusicNode
var soundFx:AudioStreamPlayer = AudioStreamPlayer.new()

func _ready() -> void:
    themeMusicNode = preload("res://assets/MusicAssets/theme_music.tscn").instantiate()
    add_child(themeMusicNode)
    soundFx.bus = "SFX"
    add_child(soundFx)
    pass

func playSFX(name:String):
    soundFx.stream = load(name)  
    soundFx.play()

func _process(delta: float) -> void:
    pass

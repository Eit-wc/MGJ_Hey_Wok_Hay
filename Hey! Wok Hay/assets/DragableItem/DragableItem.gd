extends TextureRect
@onready var burn_color:Color = Color(0.25,0.25,0.25,1)
@export var shakeLv:int = 0 :
    set (lv):
        shakeLv = lv
        if not is_instance_valid(shakeTimer):
            return
        if shakeLv == 0:
            # not shake
            shakeTimer.wait_time = 100
            shakeTimer.stop()
        elif shakeLv == 1:
            shakeTimer.wait_time = 0.5
            shakeTimer.start()
        elif shakeLv == 2:
            shakeTimer.wait_time = 0.2
            shakeTimer.start()
        elif shakeLv == 3:
            shakeTimer.wait_time = 0.1
        elif shakeLv == 4:
            #burn
            shakeTimer.wait_time = 10
            shakeTimer.stop()
            var tween = get_tree().create_tween()
            tween.tween_property(self,"modulate",burn_color,0.5)
    get:
        return shakeLv
    
var shakeTimer:Timer
func shakeTimeEvent():
    var current_pos:Vector2 = position
    var tween = get_tree().create_tween().set_trans(Tween.TRANS_CUBIC)
    tween.tween_property(self, "position", current_pos + Vector2(0,-15),0.05  ) 
    tween.tween_property(self, "position",  current_pos   ,0.05  )
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
    shakeTimer = Timer.new()
    shakeTimer.one_shot = false
    shakeTimer.autostart = false
    shakeTimer.wait_time = 10
    shakeTimer.timeout.connect(shakeTimeEvent)
    add_child(shakeTimer)
    pass # Replace with function body.
   
func _get_drag_data(at_position: Vector2) -> Variant:
    print("Drag")
    var c = Control.new()
    var dragItem:TextureRect = self.duplicate()
    c.add_child(dragItem)
    set_drag_preview(c)
    return self
    
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
    pass

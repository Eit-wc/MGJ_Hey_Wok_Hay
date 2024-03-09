extends TextureRect

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
    pass # Replace with function body.

func _input(event: InputEvent) -> void:
    #if event is InputEventMouseMotion and event.button_mask == MOUSE_BUTTON_MASK_LEFT and event.pressure>0.5:
        #var previewNode = self.duplicate()
        #set_drag_preview(previewNode)
        #pass
    pass
   
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

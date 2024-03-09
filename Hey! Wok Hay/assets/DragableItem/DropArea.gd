extends PanelContainer

@export var maxMaterial:int = 2 
var countMaterial = 0
@onready var cook_button: Button = $"../../CookButton"
@onready var parent:TextureRect = get_parent()
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
    pass # Replace with function body.

func _can_drop_data(at_position: Vector2, data: Variant) -> bool:
    return true
    
func _drop_data(at_position: Vector2, data: Variant) -> void:
    var datanode = get_node(str(data.name))
    if is_instance_valid(datanode):
        datanode.visible = true
        data.visible = false
        countMaterial +=1
        if countMaterial >= maxMaterial:
            cook_button.disabled = false
    
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
    pass

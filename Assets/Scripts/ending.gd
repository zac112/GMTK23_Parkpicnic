extends Area2D

@export var text:Node2D
var gotTable = false
var won = false
@export var end:Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
    pass # Replace with function body.


func _process(delta):
    if won and (Input.is_key_pressed(KEY_ENTER) or Input.is_key_pressed(KEY_SPACE)):
        text.hide()
        end.show()
        get_parent().queue_free()
        
func _on_area_entered(area):    
    if area.is_in_group("player") and gotTable:
        text.show()
        area.get_parent().queue_free()
        won = true
    


func _on_table_4_event():
    gotTable = true

extends Node2D
var goingBack = false

func display():
    if goingBack:
        show()
        await get_tree().create_timer(2).timeout
        hide()


func _on_table_4_event():
    goingBack = true

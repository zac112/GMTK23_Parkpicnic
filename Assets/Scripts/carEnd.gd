extends AnimatedSprite2D

var speed = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
    position.y += delta*speed


func _on_visibility_changed():
    speed =150

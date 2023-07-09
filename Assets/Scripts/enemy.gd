extends AnimatedSprite2D

var speed = 0


# Called when the node enters the scene tree for the first time.
func move():
    speed = 50
    await get_tree().create_timer(1).timeout
    speed = 0
    stop()    
    


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
    position.y += delta*speed

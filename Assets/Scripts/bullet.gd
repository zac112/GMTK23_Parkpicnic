extends AnimatedSprite2D

var direction
var ttl = 60

func setDir(theta):
    direction  = Vector2(cos(theta), sin(theta))
    selfDestruct()
    
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
    position = position+direction

func selfDestruct():
    await  await get_tree().create_timer(ttl).timeout
    queue_free()

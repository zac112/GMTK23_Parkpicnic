extends Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready():
    await get_tree().create_timer(10).timeout
    queue_free()


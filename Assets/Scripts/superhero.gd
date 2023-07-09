extends AnimatedSprite2D

var targetPos 

func _ready():
    targetPos = position
# Called when the node enters the scene tree for the first time.
func move(target):
    targetPos = Vector2(-1271,-3070)
    get_node("Herotext").show()
    await get_tree().create_timer(2).timeout
    get_node("Herotext").hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
    position += Vector2(targetPos.x-position.x,targetPos.y-position.y).normalized()*delta*50

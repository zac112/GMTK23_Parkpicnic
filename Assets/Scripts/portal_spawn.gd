extends AnimatedSprite2D

var enemy = preload("res://Assets/Prefabs/enemy.tscn")
@export var hero:Node2D
@export var fights:Node2D

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
    pass


func _on_table_4_event():
    show()
    play("spawn")
    get_node("AudioStreamPlayer2D").play()
    await get_tree().create_timer(1).timeout
    play("constant")
    await spawnMobs()
    await get_tree().create_timer(1).timeout
    play("spawn",-1,true)
    await get_tree().create_timer(1).timeout    
    stop()
    await get_tree().create_timer(3).timeout
    fights.on_table_4_event()
    hero.queue_free()
    queue_free()
    
    
func spawnMobs():
    var e = enemy.instantiate()
    add_child(e)
    e.move()
    hero.move(e)

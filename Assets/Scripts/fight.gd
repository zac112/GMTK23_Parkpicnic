extends AnimatedSprite2D

var bullet = preload("res://Assets/Prefabs/bullet.tscn")

func _ready():
    pass


func timer():
    while true:
        await get_tree().create_timer(randi_range(2,4)).timeout
        var i = 0
        playSound()
        while i<randi_range(7,20):
            await get_tree().create_timer(0.1).timeout
            var b = bullet.instantiate()
            add_child(b)
            b.setDir(i)
            i+=1
    
# Called every frame. 'delta' is the elapsed time since the previous frame.
func playSound():
    var c = find_children("AudioStream*").pick_random()
    c.play()


func _on_visibility_changed():
    timer()

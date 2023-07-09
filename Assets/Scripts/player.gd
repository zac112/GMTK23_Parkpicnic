extends PhysicsBody2D

var speed = 50
var checkpoint = Vector2(-1590,-3000)
var moving = false

# Called when the node enters the scene tree for the first time.
func _ready():    
    playSound()
        
func playAnim():
    get_node("Player").play("new_animation")
    moving = true
    
func playSound():
    while true:
        await get_tree().create_timer(randf_range(0.5,2)).timeout
        if moving:
            find_children("AudioStream*").pick_random().play()
            
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
    if Input.is_action_pressed("down"):
        move_and_collide(Vector2(0,speed) * delta)
        playAnim()
    if Input.is_action_pressed("up"):
        move_and_collide(Vector2(0,-speed) * delta)
        playAnim()
    if Input.is_action_pressed("left"):
        move_and_collide(Vector2(-speed,0) * delta)
        playAnim()
    if Input.is_action_pressed("right"):
        move_and_collide(Vector2(speed,0) * delta)        
        playAnim()
        
    if !Input.is_anything_pressed():
        get_node("Player").stop()
        moving = false
       
        
func _on_area_2d_area_entered(area):
    if area.is_in_group("bullet"):
        position = checkpoint


func _on_checkpoint_area_entered(area):
    if area.is_in_group("player"):
        checkpoint = position
        get_node("Checkpoint6").display()

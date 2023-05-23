extends characterScript

onready var FloorDetector = $FloorDetector

func _ready():
	speed.x = 60
	$Sprite/AnimationPlayer.play("active")

var direction = 1

func animation(Direction):
	if Direction == 1:
		$Sprite.flip_h = true
	else :
		$Sprite.flip_h = false

func _physics_process(_delta):
	if is_on_wall() or  !(FloorDetector.is_colliding()):
		direction *= -1
		
		animation(direction)
		
	velocity.x = direction * speed.x
	
	velocity = move_and_slide(velocity, Vector2.UP)

func _on_Kill_box_body_entered(_body):
	queue_free()

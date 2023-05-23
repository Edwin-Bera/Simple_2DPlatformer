extends StaticBody2D
onready var Animate = $Animate



func _ready():
	Animate.play("Idle")
	constant_linear_velocity.y = 0

func _process(delta):
	Launch()

func Launch():
	if Animate.get_frame() == 2 and Animate.animation == "Launch":
		constant_linear_velocity.y = -200

func _on_Area2D_body_entered(body):
	Animate.play("Launch")

func _on_Area2D_body_exited(body):
	constant_linear_velocity.y = 0
	Animate.play("Idle")

extends Area2D


func _ready():
	$tiles/AnimationPlayer.play("coin")



func _on_Coin_body_entered(body):
	if body != StaticBody2D:
		queue_free()

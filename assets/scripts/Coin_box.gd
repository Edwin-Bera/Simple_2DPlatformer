extends Area2D

var fire = 0

func _ready():
	$Coin.visible = false
	$Coin/CollisionShape2D.disabled = true

func _on_Coin_box_body_entered(body):
	if body != StaticBody2D:
		if fire == 0:
			$Coin/CollisionShape2D.set_deferred("disabled", false)
			$Coin.visible = true
			fire = 1
		


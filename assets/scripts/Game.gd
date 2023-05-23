extends Node2D

var score  = "SCORE:"
var scoreNum = 0





func _on_Coin_body_entered(body):
	if body != StaticBody2D:
		scoreNum += 1

extends Label

var score  = "SCORE:"
var scoreNum = 0

func _process(_delta):
	if $".."/Player.position.x + 300 < $".."/Player/Camera2D.limit_right and $".."/Player.position.x - 200 > $".."/Player/Camera2D.limit_left:
		rect_position.x = $".."/Player.position.x + 230
	rect_position.y = $".."/Player.position.y - 230



func _on_Coin_body_entered(body):
	if body != StaticBody2D:
		scoreNum += 1
		text = score + str(scoreNum)

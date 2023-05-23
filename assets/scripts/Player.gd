extends characterScript



func get_direction():
	return Vector2(Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left"), -1.0 if Input.is_action_just_pressed("ui_up") and is_on_floor() else 1.0)

func calculate_move_velocity(Direction):
	var return_velocity = velocity
	return_velocity.x = Direction.x * speed.x
	if Direction.y == -1:
		
		return_velocity.y = Direction.y * speed.y
	else:
		return_velocity.y += gravity * get_physics_process_delta_time()
	return return_velocity

func animation(var Direction):
	if !is_on_floor():
		$AnimatedSprite.play("Idle&Jump")
	elif Direction.x != 0 :
		$AnimatedSprite.play("Run")
		if Direction.x < 0:
			$AnimatedSprite.flip_h = false
		else:
			$AnimatedSprite.flip_h = true
	else:
		$AnimatedSprite.play("Idle&Jump")

func _physics_process(_delta):
	var direction = get_direction()
	animation(direction)
	velocity = calculate_move_velocity(direction)
	
	velocity = move_and_slide(velocity, Vector2.UP)


func _on_Player_Killer_body_entered(_body):
	if _body == self:
		$".."/Panel/score.text = $".."/Score.text
		$".."/Score.queue_free()
		$Camera2D.current = false
		$".."/Panel/Camera2D.current = true
		$".."/Panel.visible = true
		
		queue_free()




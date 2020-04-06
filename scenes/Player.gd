extends KinematicBody2D

export (int) var speed = 200
var velocity = Vector2()
var movement = "legs"

func get_input():
	velocity = Vector2()
	if Input.is_action_pressed('right'):
		velocity.x += 1
	if Input.is_action_pressed('left'):
		velocity.x -= 1
	if Input.is_action_pressed('down'):
		velocity.y += 1
	if Input.is_action_pressed('up'):
		velocity.y -= 1
	velocity = velocity.normalized() * speed

func legs_movement():
	get_input()
	velocity = move_and_slide(velocity)

func _physics_process(delta):
	if movement == "legs":
		speed = 200
		legs_movement()
	elif movement == "crippled":
		speed = 20
		legs_movement()
	else:
		print("NO MOVEMENT")

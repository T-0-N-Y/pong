extends CharacterBody2D


var winSize : Vector2
const START_SPEED : int = 275
const accel : int = 50
var speed : int
var dir : Vector2
const MAX_Y : float = 0.6

func _ready():
	winSize = get_viewport_rect().size
	#print("hi")

func new_ball():
	#print("hi")
	position.x = 126.5
	position.y = randi_range(40, 155)
	speed = START_SPEED
	dir = random_direction()

func _physics_process(delta):
	var collision = move_and_collide(dir * speed * delta)
	var collider
	
	#getting collision
	if collision:
		collider = collision.get_collider()
		#if ball hit paddle
		if collider == $"../Player" or collider == $"../CPU":
			speed += accel
			dir = new_direction(collider)
			$AudioStreamPlayer.play()
		else:
			#bounce of wall
			dir = dir.bounce(collision.get_normal())
			$AudioStreamPlayer.play()	

func random_direction():
	var newDir := Vector2()
	newDir.x = [1, -1].pick_random()
	newDir.y = randf_range(-1, 1)
	return newDir.normalized()

func new_direction(collider):
	var ballY = position.y
	var padY = collider.position.y
	var dist = ballY - padY
	var new_dir := Vector2()
	
	if dir.x > 0:
		new_dir.x = - 1
	else:
		new_dir.x =  1
	
	new_dir.y = (dist / (collider.pHeight / 2)) * MAX_Y
	return new_dir.normalized()
	

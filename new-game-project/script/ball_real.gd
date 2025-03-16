extends CharacterBody2D


var winSize : Vector2
const START_SPEED : int = 275
const accel : int = 30
var speed : int
var dir : Vector2

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
			dir = dir.bounce(collision.get_normal())
		else:
			#bounce of wall
			dir = dir.bounce(collision.get_normal())

func random_direction():
	var newDir := Vector2()
	newDir.x = [1, -1].pick_random()
	newDir.y = randf_range(-1, 1)
	return newDir.normalized()

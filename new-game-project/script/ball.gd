extends CharacterBody2D

var winSize : Vector2
const START_SPEED : int = 500
const accel : int = 50
var speed : int
var dir : Vector2

func _ready():
	winSize = get_viewport_rect().size
	
func new_ball():
	print("hi")
	position.x = winSize.x / 2
	position.y = randi_range(200, winSize.y - 200)
	speed = START_SPEED
	dir = random_direction()

func _physics_process(delta):
	move_and_collide (dir * speed * delta)

func random_direction():
	var newDir := Vector2()
	newDir.x = [1, -1].pick_random()
	newDir.y = randf_range(-1,1)
	return newDir.normalized()

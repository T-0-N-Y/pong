extends CharacterBody2D

#vector2 is a 2d coordinate
var winSize : Vector2
const START_SPEED : int = 500
const ACCEL : int = 50
var speed : int 


func _ready():
	winSize = get_viewport_rect().size

func new_ball():
	# randomise starting position
	position.x = winSize.x / 2
	position.y = randi_range(35 , 160)
	speed = START_SPEED
	dir = random_direction()

func random_direction():
	var new_dir := Vector2()
	new_dir.x = [1, -1].pick_random()
	new_dir.y = randf_range(-1, 1)



# const SPEED = 300.0
# const JUMP_VELOCITY = -400.0


# func _physics_process(delta: float) -> void:
# 	# Add the gravity.
# 	if not is_on_floor():
# 		velocity += get_gravity() * delta

# 	# Handle jump.
# 	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
# 		velocity.y = JUMP_VELOCITY

# 	# Get the input direction and handle the movement/deceleration.
# 	# As good practice, you should replace UI actions with custom gameplay actions.
# 	var direction := Input.get_axis("ui_left", "ui_right")
# 	if direction:
# 		velocity.x = direction * SPEED
# 	else:
# 		velocity.x = move_toward(velocity.x, 0, SPEED)

# 	move_and_slide()

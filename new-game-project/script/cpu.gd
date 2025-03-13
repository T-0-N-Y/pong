extends StaticBody2D

var ballPos : Vector2
var dist : int
var moveBy : int
var winHeight : int
var pHeight : int





# Called when the node enters the scene tree for the first time.
func _ready():
	winHeight = 199
	pHeight = $Sprite2D.texture.get_height()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#move paddle to ball
	ballPos = $"../ball".position
	dist = position.y - ballPos.y
	
	if abs(dist) > get_parent().PADDLE_SPEED * delta:
		moveBy = get_parent().PADDLE_SPEED * (dist / abs(dist))
	else:
		moveBy = dist
	
	print (delta)
	
	position.y -= moveBy
	position.y = clamp(position.y, 29, 164)

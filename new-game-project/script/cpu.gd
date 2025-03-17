extends StaticBody2D

var ballPos :Vector2
var dist : float
var moveBy : float
var winHeight : int
var pHeight : float

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	winHeight = 164
	var sprite = $Sprite2D  # Get the Sprite2D node
	var sprite_size = sprite.texture.get_size() * sprite.scale  # Get size considering scale 
	pHeight = sprite_size.y
	print("Sprite size: ", pHeight)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#make paddle move
	ballPos = $"../ballReal".position
	dist = position.y - ballPos.y
	
	if(abs(dist) > get_parent().PADDLE_SPEED * delta):
		moveBy = get_parent().PADDLE_SPEED  * delta * (dist / abs(dist)) 
	else:
		moveBy = dist
	
	position.y -= moveBy
	position.y = clamp(position.y, 29, 164)

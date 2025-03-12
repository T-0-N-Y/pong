extends StaticBody2D


var winHeight : int
var pHeight : float

# Called when the node enters the scene tree for the first time.
func _ready():
	#get window height
	winHeight = get_viewport_rect().size.y
	#get paddle height by getting the colorRect node
	pHeight = $ColorRect.get_size().y

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("ui_up"):
		#get_parent allows me to see var in the parent node
		position.y -= get_parent().PADDLE_SPEED * delta
	elif Input.is_action_pressed("ui_down"):
		#get_parent allows me to see var in the parent node
		position.y += get_parent().PADDLE_SPEED * delta

	# limit paddle movement so it doesnt go bye bye
	position.y = clamp(position.y, 29, 164)
	# print(position.y)

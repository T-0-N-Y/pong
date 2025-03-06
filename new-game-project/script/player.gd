extends StaticBody2D


var winHeight : int
var pHeight : int

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#get window height
	winHeight = get_viewport_rect().size.y
	#get paddle height by getting the colorRect node
	pHeight = $ColorRect.get_size().y

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_pressed("ui.up"):
		#get_parent allows me to see var in the parent node
		position.y -= get_parent().PADDLE_SPEED * delta
	elif Input.is_action_pressed("ui.down"):
		#get_parent allows me to see var in the parent node
		position.y += get_parent().PADDLE_SPEED * delta

extends Sprite2D

var score := [0, 0] #array to keep track of score
const PADDLE_SPEED : int = 100 #paddle speed

func _on_timer_timeout():
	print("pls trigger")
	$ball.new_ball()

# # Called when the node enters the scene tree for the first time.
# func _ready() -> void:
# 	pass # Replace with function body.


# # Called every frame. 'delta' is the elapsed time since the previous frame.
# func _process(delta: float) -> void:
# 	pass

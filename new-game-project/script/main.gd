extends Sprite2D

var score := [0, 0] #array to keep track of score
const PADDLE_SPEED : int = 100 #paddle speed

func _on_timer_timeout():
	print("pls trigger")
	$ballReal.new_ball()


func _on_score_left_body_entered(body: Node2D) -> void:
	score[1] += 1
	$HUD/CPUScore.text = str(score[1])
	$Timer.start()
func _on_score_right_body_entered(body: Node2D) -> void:
	score[0] += 1
	$HUD/CPUScore.text = str(score[1])
	$Timer.start()

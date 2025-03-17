extends Sprite2D

var score := [0, 0] #array to keep track of score
const PADDLE_SPEED : int = 100 #paddle speed

func _on_timer_timeout():
	if score[1] < 1 and score[0] < 1:
		$ballReal.new_ball()
		$HUD/result.text = ""

func _on_score_left_body_entered(body: Node2D) -> void:
	if score[1] < 1:
		score[1] += 1
		$HUD/CPUScore.text = str(score[1])
		$CPUScoreSound.play()
		$Timer.start()
	if score[1] == 1:
		$HUD/result.text = ("YOU LOSE")
	
func _on_score_right_body_entered(body: Node2D) -> void:
	if score[0] < 1:
		score[0] += 1
		$HUD/playerScore.text = str(score[0])
		$playerScoreSound.play()
		$Timer.start()
	if score[0] == 1:
		$HUD/win.text = ("YOU WIN")

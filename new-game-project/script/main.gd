extends Sprite2D

var score := [0, 0] #array to keep track of score
const PADDLE_SPEED : int = 100 #paddle speed
var game_over : bool = false

func _on_timer_timeout():
	if !game_over:
		$ballReal.new_ball()
		$HUD/result.text = ""
		$HUD/win.text = ""

func _on_score_left_body_entered(body: Node2D) -> void:
	if score[1] < 5:
		score[1] += 1
		$HUD/CPUScore.text = str(score[1])
		$CPUScoreSound.play()
		$Timer.start()
	if score[1] == 5:
		$HUD/result.text = ("YOU LOSE")
		game_over = true
		$Timer.stop()
		$loseSound.stream.loop = true
		$loseSound.play()
		
func _on_score_right_body_entered(body: Node2D) -> void:
	if score[0] < 5:
		score[0] += 1
		$HUD/playerScore.text = str(score[0])
		$playerScoreSound.play()
		$Timer.start()
	if score[0] == 5:
		$HUD/win.text = ("YOU WIN")
		game_over = true
		$Timer.stop()
		$winSound.stream.loop = true
		$winSound.play() 
		
func _input(event):
	if game_over and event.is_action_pressed("ui_accept"):  # Space is detected after losing
		score[0] = 0
		score[1] = 0
		game_over = false  # Reset the flag
		$HUD/result.text = ""
		$HUD/win.text = ""
		$HUD/CPUScore.text = str(score[1])
		$HUD/playerScore.text = str(score[0])
		$Timer.start()
		$loseSound.stop()
		$winSound.stop()

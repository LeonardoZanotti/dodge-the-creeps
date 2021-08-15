extends CanvasLayer

signal start_game

func update_score(score):
	$ScoreLabel.text = str(score)

func show_message(text):
	$MessageLabel.text = text
	$MessageLabel.show()
	$MessageTimer.start()
	
func show_game_over():
	show_message("Game over")
	yield($MessageTimer, "timeout")
	$MessageLabel.text = "Dodge the creeps"
	$MessageLabel.show()
	yield(get_tree().create_timer(1.0), "timeout")
	$Start.show()
	
func _on_Start_pressed():
	$Start.hide()
	emit_signal("start_game")

func _on_MessageTimer_timeout():
	$MessageLabel.hide()

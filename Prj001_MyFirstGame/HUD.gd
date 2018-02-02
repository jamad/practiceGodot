extends CanvasLayer

signal start_game

func show_message(text):
	$LabelMessage.text=text
	$LabelMessage.show()
	$TimerMessage.start()

func game_over():
	show_message('GAME OVER')
	yield($TimerMessage,"timeout")
	
	$ButtonStart.show()
	$LabelMessage.text='Dodge the Creeps!'
	$LabelMessage.show()

func update_score(score):
	$LabelScore.text=str(score)
	
func _on_TimerMessage_timeout():
	$LabelMessage.hide()
	
func _on_ButtonStart_pressed():
	$ButtonStart.hide()
	emit_signal('start_game')
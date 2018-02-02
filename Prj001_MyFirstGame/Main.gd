extends Node

export (PackedScene) var Mob
var score

func _ready():
	randomize()

func new_game():
	score=0
	$Player.start($PlayerStart.position)
	$TimerStart.start()
	$HUD.show_message('Get Ready')
	$HUD.update_score(score)
	$AudioBGM.play()
	
func game_over():
	$TimerScore.stop()
	$TimerMob.stop()
	$HUD.game_over()
	$AudioBGM.stop()
	$AudioGameover.play()
	
func _on_TimerStart_timeout():
	$TimerMob.start()	
	$TimerScore.start()

func _on_TimerScore_timeout():
	score+=1
	$HUD.update_score(score)

func _on_TimerMob_timeout():
	$PathMob/MobSpawner.set_offset(randi())
	var mob=Mob.instance()
	add_child(mob)
	mob.position=$PathMob/MobSpawner.position
	var direction=$PathMob/MobSpawner.rotation+rand_range(-PI/4,PI/4)+PI/2
	mob.rotation=direction#mob rotation
	mob.set_linear_velocity(Vector2(rand_range(mob.MIN_SPEED,mob.MAX_SPEED),0).rotated(direction))

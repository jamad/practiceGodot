extends RigidBody2D

export (int) var MIN_SPEED
export (int) var MAX_SPEED
var mob_types='fly swim walk'.split(' ')

func _ready():
	$AnimatedSprite.animation=mob_types[randi()%len(mob_types)]
	
func _on_VisibilityNotifier2D_screen_exited():
	queue_free()

func _process(delta):
	$Label.text=str($Label.get_position_in_parent())
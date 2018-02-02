extends Area2D

signal hit

export (int) var SPEED #speed of the player
var ss	#screensize

func _ready():#init
	hide()# not seen before the game starts
	ss=get_viewport_rect().size

func start(pos):
	position=pos
	show()
	monitoring=true

func _on_Player_body_entered( body ):
	hide()
	emit_signal('hit')
	call_deferred('set_monitoring',false)

func _process(delta):# update
	var v=Vector2()
	if Input.is_action_pressed('ui_right'):v.x+=1
	if Input.is_action_pressed('ui_left'):v.x-=1
	if Input.is_action_pressed('ui_down'):v.y+=1
	if Input.is_action_pressed('ui_up'):v.y-=1
	v=v.normalized()*SPEED
	position+=v*delta
	position.x=clamp(position.x,0,ss.x)#movement limit
	position.y=clamp(position.y,0,ss.y)
	
	if v.length()>0:#animation if moving
		$AnimatedSprite.play()
		if v.x!=0:
			$AnimatedSprite.animation='right'
			$AnimatedSprite.flip_h=v.x<0
			$AnimatedSprite.flip_v=false
		elif v.y!=0:
			$AnimatedSprite.animation='up'
			$AnimatedSprite.flip_v=v.y>0
	else:$AnimatedSprite.stop()


	


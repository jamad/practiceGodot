extends Node

func _ready():
	var interface=ARVRServer.find_interface('OpenVR')
	if interface && interface.initialize():
		get_viewport().arvr=true
		get_viewport().hdr=false
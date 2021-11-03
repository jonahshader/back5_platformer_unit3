extends AudioStreamPlayer

const ALIVE_VOLUME = -2
const NONALIVE_VOLUME = -11

func start_music():
	if not playing:
		play()
	volume_db = ALIVE_VOLUME
	
	
func gameover_or_survived():
	volume_db = NONALIVE_VOLUME
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

extends BasicEnemy

func damage():
	queue_free()
	Globals.SCORE += 20;

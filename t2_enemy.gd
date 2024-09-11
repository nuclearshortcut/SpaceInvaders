extends BasicEnemy

func _process(delta):
	$AnimatedSprite2D2.play("Fly");

func damage():
	queue_free()
	Globals.SCORE += 30;

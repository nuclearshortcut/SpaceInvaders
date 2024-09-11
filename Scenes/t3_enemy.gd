extends BasicEnemy

var random_num: int;

func _ready():
	randomize()

func _process(delta):
	$AnimatedSprite2D2.play("Fly");
	random_num = randi() % 300
	if random_num == 10:
		shoot()

func shoot():
		var laser = enemy_laser_scene.instantiate()
		laser.position = $LaserEmitter.position;
		add_child(laser)

func damage():
	queue_free()
	Globals.SCORE += 40;

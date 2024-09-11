extends CharacterBody2D

var can_shoot: bool = true;
var SPEED: int = 15000;
signal laser(pos);
signal hit;


var laser_scene: PackedScene = preload("res://Scenes/projectile.tscn")

func _ready():
	pass

func _physics_process(delta):
	
	# Don't move when not moving Right or Left
	velocity = Vector2.ZERO  # Reset velocity at the start of each frame

	# Move Right
	if Input.is_action_pressed("Right"):
		velocity = Vector2(SPEED * delta, 0)
	
	# Move Left
	if Input.is_action_pressed("Left"):
		velocity = Vector2(-SPEED * delta, 0)
	
	# Fire Laser
	if Input.is_action_just_pressed("Shoot") and can_shoot:
		# Emits the laser signal with laser spawn position
		shoot()
	
	move_and_slide()

func damage():
	# Reduce lives by 1 when hit 
	Globals.LIVES -= 1;
	
	# When hit spawn a new ship
	hit.emit()
	queue_free()
	
func shoot():
	print("shoot")
	laser.emit($LaserEmitter.global_position)
	can_shoot = false;
	$LaserTimer.start()

func _on_laser_timer_timeout():
	can_shoot = true;
	

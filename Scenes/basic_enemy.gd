extends CharacterBody2D
class_name BasicEnemy
var enemy_laser_scene: PackedScene = preload("res://Scenes/enemy_projectile.tscn")

var num: int = 1;

func _ready():
	pass

func _process(_delta):
	$AnimatedSprite2D.play("Fly");
	move_and_slide();
	shoot()

func _on_move_timer_timeout():
	
	if !Globals.moveright:
		position.x -= 10;
	
	if Globals.moveright:
		position.x += 10;

func damage():
	queue_free()

func up_timer():
	position.y += 10;
	$MoveTimer.wait_time -= .05

func shoot():
	pass

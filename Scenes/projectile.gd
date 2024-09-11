extends Area2D
class_name Projectile

func _ready():
	$DespawnTimer.start()

func _physics_process(delta):
	position.y -= 10;

func _on_despawn_timer_timeout():
	# Despawn when nothing has been hit
	queue_free()

func _on_body_entered(body):
	if body.has_method("damage"):
		$LaserImage.play("default")
		queue_free()
		body.damage()

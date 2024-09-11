extends Node2D

var laser_scene: PackedScene = preload("res://Scenes/projectile.tscn")

const LAYER_3 = 1 << 2  # This is bit 3, so 2^2 which equals 4

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_player_laser(pos):
	var laser = laser_scene.instantiate()
	laser.position = pos;
	
	add_child(laser)

# Make enemies move down then right/left
func _on_right_bounce_body_entered(body):
	Globals.moveright = false;
	# Make Field Area2D Mask recognize Layer 3
	$Field.collision_mask |= LAYER_3

func _on_left_bounce_body_entered(body):
	Globals.moveright = true;
	# Make Field Area2D Mask recognize Layer 3
	$Field.collision_mask |= LAYER_3

func _on_field_body_entered(body):
	if body.has_method("up_timer"):
		body.up_timer();
		# Make Field Area2D Mask no longer recognize Layer 3
		$Field.collision_mask &= ~LAYER_3;

func _on_player_hit():
	# Creates a new player when it is hit
	var player_scene: PackedScene = preload("res://Scenes/player.tscn")
	var player = player_scene.instantiate();
	player.position = $SpawnPos.global_position;
	call_deferred("add_child", player)
	
	# Reconnects signal to new player
	player.connect("hit", _on_player_hit);
	player.connect("laser", _on_player_laser);
	

extends StaticBody2D

var DEGRADE: int = -1;

func damage():
	DEGRADE += 1
	if DEGRADE == 0:
		$Sprite2D.frame = 1;
		print("change1")
	elif DEGRADE == 1:
		$Sprite2D.frame = 2;
		$CollisionPolygon2D.position.y = 14;
		print("change2")
	elif DEGRADE == 2:
		$Sprite2D.frame = 3;
		print("change3")
	elif DEGRADE == 3:
		queue_free()

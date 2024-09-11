extends Node

signal move_change
signal score_change
signal lives_change

var moveright: bool =  true:
	get:
		return moveright;
	set(value):
		moveright = value;
		move_change.emit()

var SCORE: int = 0:
	set(value):
		SCORE = value;
		emit_signal("score_change");
	get:
		return SCORE;

var LIVES: int = 3:
	set(value):
		LIVES = value;
		emit_signal("lives_change");
	get:
		return LIVES;

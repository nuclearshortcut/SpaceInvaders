extends CanvasLayer

func _ready():
	Globals.connect("lives_change", _update_lives);
	Globals.connect("score_change", _update_score_text);
	

func _update_lives():
	if Globals.LIVES < 3:
		$VBoxContainer/HBoxContainer/Life3.modulate.a = 0
	if Globals.LIVES < 2:
		$VBoxContainer/HBoxContainer/Life2.modulate.a = 0
	if Globals.LIVES < 1:
		$VBoxContainer/HBoxContainer/Life1.modulate.a = 0

func _update_score_text():
	$Label.text = "SCORE: " + str(Globals.SCORE);

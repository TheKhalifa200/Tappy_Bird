extends Control

@onready var high_score_label: Label = $MC/HighScoreLabel


# Called when the node enters the scene tree for the first time.
func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("power"):
		GameManager.load_game_scene()
	

func _ready() -> void:
	high_score_label.text = "%03d"% ScoreManager.high_score
	get_tree().paused=false

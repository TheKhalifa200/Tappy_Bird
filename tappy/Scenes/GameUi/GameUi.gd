extends Control
class_name GameUi
@onready var game_over_label: Label = $MarginContainer/GameOverLabel
@onready var press_space_label: Label = $MarginContainer/PressSpaceLabel
@onready var space_label_timer: Timer = $spaceLabelTimer
@onready var sound: AudioStreamPlayer = $Sound
@onready var score_label: Label = $MarginContainer/ScoreLabel

var _points:int=0
func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_cancel"):
		GameManager.load_main_scene()
	if press_space_label.visible and event.is_action_pressed("power"):
		GameManager.load_main_scene()

func _ready() -> void:
	SignalHub.on_plane_died.connect(on_plane_died)
	SignalHub.on_point_scored.connect(on_point_scored)
	

func on_plane_died()->void:
	game_over_label.show()
	sound.play()
	space_label_timer.start()
	ScoreManager.high_score=_points

func update_score_label()->void:
	score_label.text= "%03d"%_points

func on_point_scored()->void:
	_points+=1
	update_score_label()

func _on_space_label_timer_timeout() -> void:
	game_over_label.hide()
	press_space_label.show() # Replace with function body.

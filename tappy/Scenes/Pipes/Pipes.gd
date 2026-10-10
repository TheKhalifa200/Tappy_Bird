class_name Pipes
extends Node2D


@onready var laser: Area2D = $Laser
@onready var upper: Area2D = $Upper
@onready var lower: Area2D = $Lower
@onready var screen_notifier: VisibleOnScreenNotifier2D = $ScreenNotifier
@onready var score_sound: AudioStreamPlayer = $ScoreSound

const movement_speed:float=120.0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	SignalHub.on_plane_died.connect(on_plane_died)
 # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	position.x -= movement_speed*delta
	
func on_plane_died()->void:
	disconnect_laser()
	
func disconnect_laser()->void:
	if laser.body_exited.is_connected(_on_laser_body_exited):
		laser.body_exited.disconnect(_on_laser_body_exited)

func _on_screen_notifier_screen_exited() -> void:
	queue_free() # Replace with function body.


func _on_life_timer_timeout() -> void:
	queue_free()


func _on_body_entered(body: Node2D) -> void:
	if body is Tappy:
		body.die() # Replace with function body.


func _on_laser_body_exited(body: Node2D) -> void:
	if body is Tappy:
		disconnect_laser()
		SignalHub.emit_on_point_scored()
		score_sound.play()
		

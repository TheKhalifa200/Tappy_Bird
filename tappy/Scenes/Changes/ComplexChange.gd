class_name ComplexChange
extends CanvasLayer

@onready var animation_player: AnimationPlayer = $AnimationPlayer

func play_anim()->void:
	animation_player.play("fade")

# Called when the node enters the scene tree for the first time.
func switch_scene() -> void:
	GameManager.change_to_next()

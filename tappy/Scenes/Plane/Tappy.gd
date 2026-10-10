class_name Tappy
extends CharacterBody2D
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

var _gravity:float=ProjectSettings.get("physics/2d/default_gravity")
var _jumped:bool=false
const jump_power:float=350.0
@onready var thrust: AnimationPlayer = $Thrust


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("power"):
		_jumped=true


func die()->void:
	SignalHub.emit_on_plane_died()
	get_tree().paused=true
	# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	if _jumped:
		velocity.y-=jump_power
		_jumped=false
		thrust.play("thrust")
	#if Input.is_action_just_pressed("power"):
		#velocity.y-=jump_power
		
	velocity.y+=_gravity*delta
	move_and_slide()
	if is_on_floor():
		die()
		print("is on floor" )
		

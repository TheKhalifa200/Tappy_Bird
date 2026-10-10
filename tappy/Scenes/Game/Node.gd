extends Node

const PIPES = preload("uid://dms402y81minq")
@onready var pipes_holder: Node = $PipesHolder
@onready var upper_spawn: Marker2D = $UpperSpawn
@onready var lower_spawn: Marker2D = $LowerSpawn





func Pipe_spawn()->void:
	var new_pipes: Pipes = PIPES.instantiate()
	var y_pos:float=randf_range(
		lower_spawn.position.y,upper_spawn.position.y,
	)
	new_pipes.position=Vector2(
		upper_spawn.position.x, y_pos
	)
	pipes_holder.add_child(new_pipes)
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Pipe_spawn() # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.


func _on_spawn_timer_timeout() -> void:
	Pipe_spawn() # Replace with function body.


# Replace with function body.

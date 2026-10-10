extends Node


const MAIN = preload("uid://bk7wx4bliuk8n")
const NODE = preload("uid://eqf88mqij5r0")
const SIMPLE_CHANGE = preload("uid://cb8aadeepf4c6")
const COMPLEX_CHANGE = preload("uid://d2dhlmsgmcjoj")

var next_scene: PackedScene
var cx: ComplexChange

func _ready() -> void:
	cx=COMPLEX_CHANGE.instantiate()
	add_child(cx)

func start_transition(to_scene: PackedScene)->void:
	next_scene=to_scene
	cx.play_anim()

func change_to_next()->void:
	if next_scene:
		get_tree().change_scene_to_packed(next_scene)

func load_main_scene()->void:
	start_transition(MAIN)
	#next_scene = MAIN
	#get_tree().change_scene_to_packed(SIMPLE_CHANGE)
	
func load_game_scene()->void:
	start_transition(NODE)
	#next_scene = NODE
	#get_tree().change_scene_to_packed(SIMPLE_CHANGE)

extends Node


@onready var pipes_holder: Node = $PipesHolder
@onready var upper_spawn: Marker2D = $UpperSpawn
@onready var lower_spawn: Marker2D = $LowerSpawn


const PIPES = preload("uid://dnokfmil33cmm")
const MAIN = preload("uid://cxt5x3kdbarw8")






# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	spawn_pipes()


func spawn_pipes() -> void:
	var new_pipes: Pipes = PIPES.instantiate()
	var y_pos: float = randf_range(
		upper_spawn.position.y,
		lower_spawn.position.y
	)
	new_pipes.position = Vector2(
		upper_spawn.position.x,y_pos
		)
	pipes_holder.add_child(new_pipes)

func _on_spawn_timer_timeout() -> void:
	print("SPAWN")
	spawn_pipes()

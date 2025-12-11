extends Node2D


class_name Pipes
@onready var laser: Area2D = $Laser
@onready var scoresound: AudioStreamPlayer2D = $scoresound


const SPEED : float = 120.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	SignalHub.on_plane_died.connect(on_plane_died)


func on_plane_died() -> void:
	disconnect_laser()

func disconnect_laser() -> void:
	if laser.body_exited.is_connected(_on_laser_body_exited):
		laser.body_exited.disconnect(_on_laser_body_exited)
	
func _physics_process(delta: float) -> void:
	position.x -= SPEED * delta


func _on_screen_notifier_screen_exited() -> void:
	queue_free()


func _on_life_timer_timeout() -> void:
	queue_free()


func _on_body_entered(body: Node2D) -> void:
	if body is Tappy:
		body.die() 


func _on_laser_body_exited(body: Node2D) -> void:
	if body is Tappy:
		scoresound.play()
		disconnect_laser()
		SignalHub.emit_on_point_scored()

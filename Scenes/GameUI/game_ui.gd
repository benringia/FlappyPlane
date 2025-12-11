extends Control


class_name GameUi

@onready var game_over_label: Label = $MarginContainer/GameOver
@onready var timer: Timer = $Timer
@onready var sound: AudioStreamPlayer2D = $Sound
@onready var press_space: Label = $MarginContainer/PressSpace
@onready var score: Label = $MarginContainer/Score

var _points: int = 0

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_cancel"):
		GameManager.load_main_scene()
	if press_space.visible and event.is_action_pressed("power"):
		GameManager.load_main_scene()
func on_plane_died() -> void:
	game_over_label.show()
	sound.play()
	timer.start()
	ScoreManager.high_score = _points
	
func on_point_scored() -> void:
	_points += 1
	update_score_label()
	
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	SignalHub.on_plane_died.connect(on_plane_died)
	SignalHub.on_point_scored.connect(on_point_scored)
	update_score_label()

func update_score_label() -> void:
	score.text = "%03d" % _points
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_timer_timeout() -> void:
	press_space.show()
	game_over_label.hide()

extends Control


const GAME_OVER_AUDIO_STREAM: AudioStreamWAV = (
	preload("res://assets/audio/game_over.wav")
)

var _label_game_over: Label
var _label_continue: Label
var _label_score: Label
var _restart_timer: Timer
var _audio_stream_player: AudioStreamPlayer

var _can_restart: bool = false
var _score: int = 0


func _enter_tree() -> void:
	EventHub.point_scored.connect(_on_point_scored)


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_label_game_over = $MarginContainer/LabelGameOver
	_label_continue = $MarginContainer/LabelContinue
	_label_score = $MarginContainer/LabelScore
	_restart_timer = $RestartTimer
	_audio_stream_player = $AudioStreamPlayer
	EventHub.game_over.connect(_on_game_over)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _unhandled_input(event: InputEvent) -> void:
	if _can_restart and event.is_action_pressed("restart_game"):
		_can_restart = false
		SceneManager.load_main()


func _on_game_over() -> void:
	_audio_stream_player.stream = GAME_OVER_AUDIO_STREAM
	_audio_stream_player.play()
	ScoreManager.record = _score
	_label_game_over.show()
	_restart_timer.start()


func _on_restart_timer_timeout() -> void:
	_can_restart = true
	_label_game_over.hide()
	_label_continue.show()


func _on_point_scored() -> void:
	_audio_stream_player.play()
	_score += 1
	_label_score.text = "%03d" % _score

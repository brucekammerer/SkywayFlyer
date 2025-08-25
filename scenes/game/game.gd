extends Node2D


var _marker_upper: Marker2D
var _marker_lower: Marker2D


func _enter_tree() -> void:
	EventHub.game_over.connect(_on_game_over)


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_marker_upper = $MarkerUpper
	_marker_lower = $MarkerLower
	spawn_pipes()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_game_over() -> void:
	get_tree().paused = true


func spawn_pipes() -> void:
	var pipes: Pipes = SceneManager.PIPES.instantiate()
	pipes.position.y = randf_range(
		_marker_lower.position.y,
		_marker_upper.position.y
	)
	pipes.position.x = _marker_lower.position.x
	add_child(pipes)

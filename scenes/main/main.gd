extends Control


var _label_record_value: Label


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("start_game"):
		SceneManager.load_game()


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	get_tree().paused = false
	_label_record_value = $MarginContainer/LabelRecordValue
	_label_record_value.text = "%03d" % ScoreManager.record


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

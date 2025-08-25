extends Node2D


class_name Pipes


const VELOCITY: float = -150.0 # px/s


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position.x += VELOCITY * delta


func die() -> void:
	if not is_queued_for_deletion():
		queue_free()

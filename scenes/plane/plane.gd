extends CharacterBody2D


class_name TappyPlane


const INITIAL_VELOCITY_Y = -350 # px/s

var _animation_player: AnimationPlayer

var _gravity = ProjectSettings.get("physics/2d/default_gravity")


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_animation_player = $AnimationPlayer
	velocity = Vector2(0, INITIAL_VELOCITY_Y)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("plane_up"):
		_animation_player.play("up")
		velocity.y = INITIAL_VELOCITY_Y
	velocity.y += _gravity * delta
	move_and_slide()
	if is_on_floor() or is_on_ceiling():
		die()


func die() -> void:
	EventHub.emit_game_over()
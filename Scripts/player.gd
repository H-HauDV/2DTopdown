extends CharacterBody2D

@export var speed: float = 220.0
@export var stop_distance: float = 4.0

var target_position: Vector2
var has_target := false

func _ready() -> void:
	target_position = global_position

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_RIGHT and event.pressed:
		target_position = get_global_mouse_position()
		has_target = true

func _physics_process(_delta: float) -> void:
	if has_target:
		var to_target := target_position - global_position
		if to_target.length() <= stop_distance:
			has_target = false
			velocity = Vector2.ZERO
		else:
			velocity = to_target.normalized() * speed
	else:
		velocity = Vector2.ZERO

	move_and_slide()

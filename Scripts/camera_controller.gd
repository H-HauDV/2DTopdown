extends Camera2D

@export var speed: float = 360.0
@export var zoom_step: float = 0.1
@export var min_zoom: float = 0.6
@export var max_zoom: float = 2.0

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.pressed:
		if event.button_index == MOUSE_BUTTON_WHEEL_DOWN:
			set_zoom_level(zoom.x - zoom_step)
		elif event.button_index == MOUSE_BUTTON_WHEEL_UP:
			set_zoom_level(zoom.x + zoom_step)

func _process(delta: float) -> void:
	var direction := Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	position += direction * speed * delta

func set_zoom_level(value: float) -> void:
	var clamped = clamp(value, min_zoom, max_zoom)
	zoom = Vector2(clamped, clamped)

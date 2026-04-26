extends Control

var is_drag_visible := false
var drag_start := Vector2.ZERO
var drag_end := Vector2.ZERO

func update_drag_rect(visible_state: bool, start_position: Vector2, end_position: Vector2) -> void:
	is_drag_visible = visible_state
	drag_start = start_position
	drag_end = end_position
	queue_redraw()

func _draw() -> void:
	if not is_drag_visible:
		return

	var rect := Rect2(drag_start, drag_end - drag_start).abs()
	draw_rect(rect, Color(0.3, 0.9, 0.5, 0.18), true)
	draw_rect(rect, Color(0.45, 1.0, 0.6, 0.95), false, 2.0)

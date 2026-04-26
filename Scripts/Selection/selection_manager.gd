extends Node2D

signal selection_changed(selected_characters: Array)
signal primary_selection_changed(primary_character)

@export var controllable_holder_path: NodePath
@export var roster_panel_path: NodePath
@export var drag_overlay_path: NodePath
@export var selection_button: MouseButton = MOUSE_BUTTON_LEFT
@export var select_radius: float = 18.0
@export var drag_start_threshold: float = 10.0

var controllable_characters: Array = []
var selected_characters: Array = []
var primary_character = null
var is_dragging := false
var is_drag_selecting := false
var drag_started_with_shift := false
var drag_start_screen := Vector2.ZERO
var drag_current_screen := Vector2.ZERO
var drag_start_world := Vector2.ZERO
var drag_current_world := Vector2.ZERO

@onready var controllable_holder: Node = get_node_or_null(controllable_holder_path)
@onready var roster_panel: Control = get_node_or_null(roster_panel_path)
@onready var drag_overlay: Control = get_node_or_null(drag_overlay_path)

func _ready() -> void:
	refresh_characters()

	if roster_panel != null and roster_panel.has_method("setup"):
		roster_panel.setup(self)
		roster_panel.set_characters(controllable_characters)

	if not controllable_characters.is_empty():
		select_one(controllable_characters[0])

func refresh_characters() -> void:
	controllable_characters.clear()

	if controllable_holder == null:
		return

	for child in controllable_holder.get_children():
		if child.has_method("set_selected"):
			controllable_characters.append(child)

func get_selected_characters() -> Array:
	return selected_characters.duplicate()

func select_one(character, additive: bool = false) -> void:
	if character == null:
		if not additive:
			clear_selection()
		return

	if not additive:
		_clear_selection_state()

	if not selected_characters.has(character):
		selected_characters.append(character)
		character.set_selected(true)

	_set_primary_character(character)
	_emit_selection_signals()

func toggle_select(character) -> void:
	if character == null:
		return

	if selected_characters.has(character):
		selected_characters.erase(character)
		character.set_selected(false)
		if primary_character == character:
			_set_primary_character(selected_characters.back() if not selected_characters.is_empty() else null)
	else:
		selected_characters.append(character)
		character.set_selected(true)
		_set_primary_character(character)

	_emit_selection_signals()

func select_many(characters: Array, additive: bool = false) -> void:
	if not additive:
		_clear_selection_state()

	for character in characters:
		if character != null and not selected_characters.has(character):
			selected_characters.append(character)
			character.set_selected(true)

	_set_primary_character(selected_characters[0] if not selected_characters.is_empty() else null)
	_emit_selection_signals()

func clear_selection() -> void:
	_clear_selection_state()
	_set_primary_character(null)
	_emit_selection_signals()

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.button_index == selection_button:
		if event.pressed:
			_begin_drag_selection(event)
		else:
			_finish_drag_selection()
		return

	if event is InputEventMouseMotion and is_dragging:
		drag_current_screen = event.position
		drag_current_world = get_global_mouse_position()
		if not is_drag_selecting and drag_start_screen.distance_to(drag_current_screen) >= drag_start_threshold:
			is_drag_selecting = true
		_update_drag_overlay()

func _get_character_at_position(world_position: Vector2):
	for index in range(controllable_characters.size() - 1, -1, -1):
		var character = controllable_characters[index]
		if not is_instance_valid(character):
			continue

		if character.has_method("contains_world_point") and character.contains_world_point(world_position):
			return character

		if character.global_position.distance_to(world_position) <= select_radius:
			return character

	return null

func _clear_selection_state() -> void:
	for character in selected_characters:
		if is_instance_valid(character):
			character.set_selected(false)
	selected_characters.clear()

func _begin_drag_selection(event: InputEventMouseButton) -> void:
	is_dragging = true
	is_drag_selecting = false
	drag_started_with_shift = event.shift_pressed
	drag_start_screen = event.position
	drag_current_screen = event.position
	drag_start_world = get_global_mouse_position()
	drag_current_world = drag_start_world
	_update_drag_overlay()

func _finish_drag_selection() -> void:
	if not is_dragging:
		return

	drag_current_world = get_global_mouse_position()

	if is_drag_selecting:
		var selected_in_box := _get_characters_in_world_rect(_get_drag_world_rect())
		select_many(selected_in_box, drag_started_with_shift)
	else:
		var clicked_character = _get_character_at_position(get_global_mouse_position())
		if drag_started_with_shift:
			if clicked_character != null:
				toggle_select(clicked_character)
		else:
			select_one(clicked_character)

	is_dragging = false
	is_drag_selecting = false
	_update_drag_overlay()

func _update_drag_overlay() -> void:
	if drag_overlay != null and drag_overlay.has_method("update_drag_rect"):
		drag_overlay.update_drag_rect(is_drag_selecting, drag_start_screen, drag_current_screen)

func _get_drag_world_rect() -> Rect2:
	return Rect2(drag_start_world, drag_current_world - drag_start_world).abs()

func _get_characters_in_world_rect(world_rect: Rect2) -> Array:
	var characters_in_rect: Array = []
	for character in controllable_characters:
		if not is_instance_valid(character):
			continue

		if world_rect.has_point(character.global_position):
			characters_in_rect.append(character)

	return characters_in_rect

func _set_primary_character(character) -> void:
	primary_character = character
	primary_selection_changed.emit(primary_character)

func _emit_selection_signals() -> void:
	selection_changed.emit(get_selected_characters())

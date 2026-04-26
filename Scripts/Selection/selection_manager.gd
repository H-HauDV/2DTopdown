extends Node2D

signal selection_changed(selected_characters: Array)
signal primary_selection_changed(primary_character)

@export var controllable_holder_path: NodePath
@export var roster_panel_path: NodePath
@export var selection_button: MouseButton = MOUSE_BUTTON_LEFT
@export var select_radius: float = 18.0

var controllable_characters: Array = []
var selected_characters: Array = []
var primary_character = null

@onready var controllable_holder: Node = get_node_or_null(controllable_holder_path)
@onready var roster_panel: Control = get_node_or_null(roster_panel_path)

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
	if event is InputEventMouseButton and event.button_index == selection_button and event.pressed:
		var clicked_character = _get_character_at_position(get_global_mouse_position())
		if event.shift_pressed:
			if clicked_character != null:
				toggle_select(clicked_character)
		else:
			select_one(clicked_character)

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

func _set_primary_character(character) -> void:
	primary_character = character
	primary_selection_changed.emit(primary_character)

func _emit_selection_signals() -> void:
	selection_changed.emit(get_selected_characters())

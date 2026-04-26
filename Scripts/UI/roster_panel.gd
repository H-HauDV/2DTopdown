extends PanelContainer

var selection_manager
var characters: Array = []
var character_buttons: Dictionary = {}

@onready var title_label: Label = $MarginContainer/VBoxContainer/TitleLabel
@onready var character_list: VBoxContainer = $MarginContainer/VBoxContainer/CharacterList

func setup(manager) -> void:
	selection_manager = manager
	if not selection_manager.selection_changed.is_connected(_on_selection_changed):
		selection_manager.selection_changed.connect(_on_selection_changed)

func set_characters(new_characters: Array) -> void:
	characters = new_characters.duplicate()
	_rebuild_list()

func _rebuild_list() -> void:
	for child in character_list.get_children():
		child.queue_free()

	character_buttons.clear()
	title_label.text = "Squad"

	for character in characters:
		var button := Button.new()
		button.text = _get_character_label(character)
		button.alignment = HORIZONTAL_ALIGNMENT_LEFT
		button.toggle_mode = true
		button.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		button.custom_minimum_size = Vector2(180, 32)
		button.gui_input.connect(_on_character_button_gui_input.bind(character))
		character_list.add_child(button)
		character_buttons[character] = button

	_update_button_states([])

func _on_character_button_gui_input(event: InputEvent, character) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		if selection_manager == null:
			return

		if event.shift_pressed:
			selection_manager.toggle_select(character)
		else:
			selection_manager.select_one(character)

		get_viewport().set_input_as_handled()

func _on_selection_changed(selected_characters: Array) -> void:
	_update_button_states(selected_characters)

func _update_button_states(selected_characters: Array) -> void:
	for character in character_buttons.keys():
		var button: Button = character_buttons[character]
		button.button_pressed = selected_characters.has(character)
		button.text = _get_character_label(character)
		if button.button_pressed:
			button.modulate = Color(0.78, 0.94, 0.78, 1)
		else:
			button.modulate = Color(1, 1, 1, 1)

func _get_character_label(character) -> String:
	if character == null:
		return "Unknown"

	if character.has_method("get_display_name"):
		return character.get_display_name()

	return String(character.name)

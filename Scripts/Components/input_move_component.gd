extends "res://Scripts/Core/entity_component.gd"
class_name InputMoveComponent

@export var click_button: MouseButton = MOUSE_BUTTON_RIGHT
@export var movement_component_key: StringName = &"MovementComponent"

var movement_component: Node

func on_component_added() -> void:
	movement_component = entity.get_component(movement_component_key)

func component_unhandled_input(event: InputEvent) -> void:
	if movement_component == null or not movement_component.has_method("set_target"):
		return

	if event is InputEventMouseButton and event.button_index == click_button and event.pressed:
		var selection_manager = entity.get_tree().get_first_node_in_group("selection_manager")
		if selection_manager == null:
			movement_component.set_target(entity.get_global_mouse_position())
			return

		var selected_characters: Array = selection_manager.get_selected_characters()
		if selected_characters.has(entity):
			movement_component.set_target(entity.get_global_mouse_position())

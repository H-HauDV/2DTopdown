extends CharacterBody2D
class_name BaseEntity

@export var accepts_player_input: bool = true

@onready var component_manager = $ComponentManager
@onready var components_root: Node = $Components

var is_selected: bool = false

func _ready() -> void:
	component_manager.setup(self)

	for child in components_root.get_children():
		if child.has_method("get_component_key"):
			component_manager.register_component(child)

func _unhandled_input(event: InputEvent) -> void:
	if accepts_player_input and not is_selected:
		return

	component_manager.forward_unhandled_input(event)

func _physics_process(delta: float) -> void:
	component_manager.forward_physics_process(delta)
	move_and_slide()

func add_component(component: Node) -> void:
	if component.get_parent() != components_root:
		components_root.add_child(component)
	component_manager.register_component(component)

func remove_component(key: StringName) -> void:
	component_manager.unregister_component(key)

func get_component(key: StringName):
	return component_manager.get_component(key)

func has_component(key: StringName) -> bool:
	return component_manager.has_component(key)

func set_selected(value: bool) -> void:
	is_selected = value

func get_is_selected() -> bool:
	return is_selected

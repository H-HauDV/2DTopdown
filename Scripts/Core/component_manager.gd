extends Node
class_name ComponentManager

var owner_entity: CharacterBody2D
var components: Dictionary = {}

func setup(entity: CharacterBody2D) -> void:
	owner_entity = entity

func register_component(component: Node) -> void:
	var key: StringName = component.get_component_key()
	if components.has(key):
		push_warning("Component already registered: %s" % String(key))
		return

	components[key] = component
	component.setup(owner_entity)
	component.on_component_added()

func unregister_component(key: StringName) -> void:
	if not components.has(key):
		return

	var component = components[key]
	component.on_component_removed()
	components.erase(key)

func get_component(key: StringName):
	return components.get(key, null)

func has_component(key: StringName) -> bool:
	return components.has(key)

func forward_unhandled_input(event: InputEvent) -> void:
	for component in components.values():
		component.component_unhandled_input(event)

func forward_physics_process(delta: float) -> void:
	for component in components.values():
		component.component_physics_process(delta)

extends Node
class_name EntityComponent

@export var component_key: StringName = &""

var entity: CharacterBody2D

func setup(owner_entity: CharacterBody2D) -> void:
	entity = owner_entity

func on_component_added() -> void:
	pass

func on_component_removed() -> void:
	pass

func component_unhandled_input(_event: InputEvent) -> void:
	pass

func component_physics_process(_delta: float) -> void:
	pass

func get_component_key() -> StringName:
	if component_key != &"":
		return component_key
	return StringName(name)

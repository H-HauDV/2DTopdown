extends "res://Scripts/Core/entity_component.gd"
class_name MovementComponent

@export var speed: float = 220.0
@export var stop_distance: float = 4.0

var target_position: Vector2
var has_target := false

func on_component_added() -> void:
	target_position = entity.global_position

func set_target(world_position: Vector2) -> void:
	target_position = world_position
	has_target = true

func clear_target() -> void:
	has_target = false
	entity.velocity = Vector2.ZERO

func component_physics_process(_delta: float) -> void:
	if not has_target:
		entity.velocity = Vector2.ZERO
		return

	var to_target := target_position - entity.global_position
	if to_target.length() <= stop_distance:
		clear_target()
		return

	entity.velocity = to_target.normalized() * speed

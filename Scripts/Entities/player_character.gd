extends "res://Scripts/Entities/human.gd"
class_name PlayerCharacter

@export var display_name: String = "Survivor"

@onready var selection_ring: Node2D = $SelectionRing

func _ready() -> void:
	selection_ring.visible = false
	super._ready()

func set_selected(selected_value: bool) -> void:
	super.set_selected(selected_value)
	selection_ring.visible = selected_value

func contains_world_point(world_position: Vector2) -> bool:
	var half_size := Vector2(10, 14)
	return Rect2(global_position - half_size, half_size * 2.0).has_point(world_position)

func get_display_name() -> String:
	return display_name

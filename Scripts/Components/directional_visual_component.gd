extends "res://Scripts/Core/entity_component.gd"
class_name DirectionalVisualComponent

@export var sprite_path: NodePath = NodePath("../../Sprite2D")
@export var idle_threshold: float = 8.0
@export var down_texture: Texture2D
@export var up_texture: Texture2D
@export var left_texture: Texture2D
@export var right_texture: Texture2D

var sprite: Sprite2D
var facing_direction: StringName = &"down"

func on_component_added() -> void:
	sprite = get_node_or_null(sprite_path) as Sprite2D
	_apply_texture()

func component_physics_process(_delta: float) -> void:
	if sprite == null:
		return

	var velocity: Vector2 = entity.velocity
	if velocity.length() < idle_threshold:
		return

	if absf(velocity.x) > absf(velocity.y):
		facing_direction = &"right" if velocity.x > 0.0 else &"left"
	else:
		facing_direction = &"down" if velocity.y > 0.0 else &"up"

	_apply_texture()

func _apply_texture() -> void:
	if sprite == null:
		return

	match facing_direction:
		&"up":
			sprite.texture = up_texture
		&"left":
			sprite.texture = left_texture
		&"right":
			sprite.texture = right_texture
		_:
			sprite.texture = down_texture

extends "res://Scripts/Core/entity_component.gd"
class_name DirectionalVisualComponent

@export var sprite_path: NodePath = NodePath("../../AnimatedSprite2D")
@export var idle_threshold: float = 8.0
@export var idle_animation_prefix: String = "idle_"
@export var walk_animation_prefix: String = "walk_"

var sprite: AnimatedSprite2D
var facing_direction: StringName = &"down"
var current_animation: StringName = &""

func on_component_added() -> void:
	sprite = get_node_or_null(sprite_path) as AnimatedSprite2D
	_play_animation(StringName(idle_animation_prefix + String(facing_direction)))

func component_physics_process(_delta: float) -> void:
	if sprite == null:
		return

	var velocity: Vector2 = entity.velocity
	var is_moving := velocity.length() >= idle_threshold

	if is_moving and absf(velocity.x) > absf(velocity.y):
		facing_direction = &"right" if velocity.x > 0.0 else &"left"
	elif is_moving:
		facing_direction = &"down" if velocity.y > 0.0 else &"up"

	var animation_prefix := walk_animation_prefix if is_moving else idle_animation_prefix
	_play_animation(StringName(animation_prefix + String(facing_direction)))

func _play_animation(animation_name: StringName) -> void:
	if sprite == null:
		return

	if current_animation == animation_name and sprite.is_playing():
		return

	current_animation = animation_name
	sprite.play(String(animation_name))

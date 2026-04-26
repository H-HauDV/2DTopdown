extends Node2D

@onready var sprite: Sprite2D = $Sprite2D

func set_texture(new_texture: Texture2D) -> void:
	sprite.texture = new_texture

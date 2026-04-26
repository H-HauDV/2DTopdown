extends Node2D

@onready var selection_manager: Node = $SelectionManager

func _ready() -> void:
	if selection_manager != null and selection_manager.has_method("refresh_characters"):
		selection_manager.refresh_characters()

extends Node2D

const TILE_SCENE := preload("res://Scenes/Tile.tscn")
const TILE_SIZE := 32

var tile_textures: Array[Texture2D] = [
	preload("res://Assets/Tiles/grass.svg"),
	preload("res://Assets/Tiles/dirt.svg"),
	preload("res://Assets/Tiles/water.svg")
]

var map_data: Array[Array] = [
	[0, 0, 0, 0, 1, 1, 1, 0, 0, 2, 2, 2, 0, 0, 0, 0],
	[0, 0, 1, 0, 1, 1, 1, 0, 0, 2, 2, 2, 0, 1, 0, 0],
	[0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0],
	[0, 1, 1, 0, 0, 2, 2, 2, 0, 0, 1, 0, 0, 0, 1, 0],
	[0, 0, 0, 0, 0, 2, 2, 2, 0, 0, 1, 1, 1, 0, 0, 0],
	[1, 1, 0, 0, 0, 2, 2, 2, 0, 0, 0, 0, 1, 0, 0, 0],
	[1, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 2, 2],
	[0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 0, 0, 0, 2, 2],
	[0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 1, 1, 2, 2],
	[2, 2, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 1, 1, 0, 0],
	[2, 2, 0, 0, 1, 1, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0],
	[2, 2, 0, 0, 1, 1, 0, 0, 0, 0, 2, 2, 2, 0, 0, 0]
]

func _ready() -> void:
	generate_map()

func generate_map() -> void:
	for y in range(map_data.size()):
		for x in range(map_data[y].size()):
			var tile_index: int = map_data[y][x]
			if tile_index < 0 or tile_index >= tile_textures.size():
				continue

			var tile := TILE_SCENE.instantiate()
			add_child(tile)
			tile.position = Vector2(x * TILE_SIZE, y * TILE_SIZE)
			tile.set_texture(tile_textures[tile_index])

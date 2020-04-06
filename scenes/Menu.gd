extends Node2D

const MOVEMENTS = ["crippled", "legs"]
const WEAPONS = ["pistol", "autopistol"]
const KITS = ["papers", "shelter", "towers"]

onready var level_scene = preload("res://scenes/Level.tscn")
onready var player_scene = preload("res://scenes/Player.tscn")

var movement_index = 0
var weapon_index = 0
var kit_index = 0

func _ready() -> void:
	pass

func _prev(index, length) -> int:
	if index > 0:
		return index - 1
	else:
		return length - 1

func _next(index, length) -> int:
	if index >= length - 1:
		return 0
	else:
		return index + 1

func _on_prev_movement() -> void:
	movement_index = _prev(movement_index, len(MOVEMENTS))

func _on_next_movement() -> void:
	movement_index = _next(movement_index, len(MOVEMENTS))


func _on_prev_weapon() -> void:
	weapon_index = _prev(weapon_index, len(WEAPONS))


func _on_next_weapon() -> void:
	weapon_index = _next(weapon_index, len(WEAPONS))


func _on_prev_kit() -> void:
	kit_index = _prev(kit_index, len(KITS))


func _on_next_kit() -> void:
	kit_index = _next(kit_index, len(KITS))


func _on_play() -> void:
	var level = level_scene.instance()
	var player = player_scene.instance()
	player.movement = "crippled"
	var viewport = get_viewport_rect().end
	player.position = Vector2(viewport.x / 2, viewport.y / 2)
	level.add_child(player)
	get_tree().get_root().add_child(level)

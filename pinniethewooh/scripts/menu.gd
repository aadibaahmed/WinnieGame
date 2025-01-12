class_name MainMenu
extends Control

@onready var start: Button = $MarginContainer/HBoxContainer/Start
@onready var exit: Button = $MarginContainer/HBoxContainer/Exit
@onready var start_level = preload("res://scenes/game.tscn") as PackedScene
# Called when the node enters the scene tree for the first time.

func _ready() -> void:
	start.button_down.connect(on_start_pressesd)
	exit.button_down.connect(on_exit_pressesd)
	
func on_start_pressesd() -> void:
	get_tree().change_scene_to_packed(start_level)

	
func on_exit_pressesd() -> void:
	get_tree().quit()

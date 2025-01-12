extends Node2D

var state = "un_opened"
var chest_opened = false
var player_in_range = false


func _ready() -> void:
	$AnimatedSprite2D.play("chest_front_idle")
	
func _process(_delta) -> void:
	if(state == "un_opened"):
		if(player_in_range):
			if(Input.is_action_just_pressed("interact")):
				$AnimatedSprite2D.play("chest_front_open")						#figure out how to have this pplay and then stop with the chest opened
				chest_opened = true
				_chest_opened(chest_opened)

func _chest_opened(is_chest_open):
	if(is_chest_open):
		$AnimatedSprite2D.play("chest_front_opened")

func _on_area_2d_body_entered(body: Node2D) -> void:
	if(body.has_method("player")):
		player_in_range = true

func _on_area_2d_body_exited(body: Node2D) -> void:
	if(body.has_method("player")):
		player_in_range = false

extends Node2D

var state = "no_apples"
var player_in_range = false

# Called when the node enters the scene tree for the first time.
func _ready():
	if(state == "no_apples"):
		$Timer.start()
		
func _process(_delta):
	if(state == "no_apples"):
		$AnimatedSprite2D.play("no_apples")
	if(state == "grew_apples"):
		$AnimatedSprite2D.play("with_apples")
		if(player_in_range):
			if(Input.is_action_just_pressed("interact")):
				state = "no_apples"
				$Timer.start()

func _on_area_2d_body_entered(body: Node2D) -> void:
	if(body.has_method("player")):
		player_in_range = true
	
func _on_area_2d_body_exited(body: Node2D) -> void:
	if(body.has_method("player")):
		player_in_range = false
		
func _on_timer_timeout() -> void:
	if (state == "no_apples"):
		state = "grew_apples"
	

extends CharacterBody2D


@export var move_speed : float = 80
@export var starting_direction : Vector2 = Vector2(0,1)

@onready var animation_tree = $AnimationTree
@onready var state_machine = animation_tree.get("parameters/playback")

func _ready():
	update_params(starting_direction)

func _physics_process(_delta):
	# Get input directions
	var input_direction = Vector2(
		Input.get_action_strength("right") - Input.get_action_strength("left"),
		Input.get_action_strength("down") - Input.get_action_strength("up")
	)
	update_params(input_direction)
	velocity = input_direction * move_speed
	
	move_and_slide()
	change_state()
func update_params(input_direction : Vector2):
		
	if(input_direction != Vector2.ZERO):
		animation_tree.set("parameters/Walk/blend_position", input_direction)
		animation_tree.set("parameters/Idle/blend_position", input_direction)
func change_state():
	if(velocity != Vector2.ZERO):
		state_machine.travel("Walk")
	else:
		state_machine.travel("Idle")
func player():
	pass

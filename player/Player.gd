extends CharacterBody2D

@export var speed = 400 # How fast the player will move (pixels/sec).

@onready var state_machine = $AnimationTree.get("parameters/playback")

func _ready():
	$AnimationTree.active = true
	$AnimationTree.set("parameters/Idle/blend_position", Vector2.DOWN)

func _process(delta):
	var inputV2 = Vector2.ZERO # The player's movement vector.
	if Input.is_action_pressed("ui_right"):
		inputV2.x += 1
	if Input.is_action_pressed("ui_left"):
		inputV2.x -= 1
	if Input.is_action_pressed("ui_down"):
		inputV2.y += 1
	if Input.is_action_pressed("ui_up"):
		inputV2.y -= 1
	inputV2 = inputV2.normalized()
	if inputV2.length() > 0:
		position += inputV2 * delta * speed
		$AnimationTree.set("parameters/Idle/blend_position", inputV2)
		$AnimationTree.set("parameters/Move/blend_position", inputV2)
		state_machine.travel("Move")
	else:
		state_machine.travel("Idle")


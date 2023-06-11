extends CharacterBody2D

const SPEED = 50.0

@onready var navigation_agent_2d = $NavigationAgent2D


func _physics_process(delta):
	var dir = get_nav_position()
	velocity = dir * SPEED
	move_and_slide()


func get_nav_position():
	var player = get_tree().get_first_node_in_group("player") as Node2D
	if !player:
		return
	navigation_agent_2d.target_position = player.global_position
	return to_local(navigation_agent_2d.get_next_path_position()).normalized()

extends CharacterBody2D

@onready var timer = $Timer

const SPEED = 300.0

var is_hurting = false
var hurt_attack: Attack


func _physics_process(delta):
	if is_hurting:
		hurt()
	else:
		move()


func move():
	var direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down").normalized()
	if direction:
		velocity = direction * SPEED
	else:
		velocity = Vector2.ZERO

	move_and_slide()


func hurt():
	velocity = (global_position - hurt_attack.position).normalized() * hurt_attack.force
	print(hurt_attack.damage)
	move_and_slide()


func _on_hurt_box_hurt(attack: Attack):
	if is_hurting:
		return
	
	is_hurting = true
	timer.start()
	hurt_attack = attack


func _on_timer_timeout():
	is_hurting = false

extends Area2D
class_name HitBox

var attack: Attack


func _ready():
	attack = Attack.new()
	attack.damage = 1.0
	attack.position = global_position
	attack.force = 1000.0

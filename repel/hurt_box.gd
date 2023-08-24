extends Area2D
class_name HurtBox

signal hurt(attack: Attack)


func _on_area_entered(area):
	if area is HitBox:
		hurt.emit(area.attack)

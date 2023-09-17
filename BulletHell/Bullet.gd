extends Node2D
class_name Bullet

@export_color_no_alpha var color: Color = Color.REBECCA_PURPLE

var speed: float = 100.0
var speed_x: float = 100.0
var speed_y: float = 100.0
var init_rotation: float = 0.0
var y_change_value: int = -1
var offset: float = 0.0


func _draw():
	draw_circle(Vector2.ZERO, 10.0, color)


func _ready():
	rotate(init_rotation)
	position += Vector2(cos(init_rotation), sin(init_rotation)) * 100


func _physics_process(delta):
	action0(delta)


func action0(delta):
	position += transform.x * speed_x * delta * 2


func action1(delta):
	speed_y *= 1.02
	position += (transform.x * speed_x * delta * 0.5) - transform.y * speed_y * delta


func action2(delta):
	speed_y *= 1.01
	offset += delta * 2
	position += (transform.x * speed_x * delta * 0.5) - transform.y * cos(offset * 1.2) * speed_y * delta


func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()

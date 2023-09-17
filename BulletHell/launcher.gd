extends Node2D

@export_range(1, 36) var trajectory_count: int = 6
@export var wait_time: float = 0.05

@onready var bullets_pool = $"../BulletsPool"
@onready var timer = $Timer

var bullet_scene = preload("res://bullet.tscn")
var colors = ["#FF0000","#FF7F00","#FFFF00","#00FF00","#00FFFF","#0000FF" ,"#8B00FF"]
var color_index = -1
var add_or_delete = 1
var add_c = 1.0
var rotation_ = 0.0
var time = 0

func _ready():
	timer.wait_time = wait_time


func _physics_process(delta):
	if add_c > 5:
#		add_c = 1.0
		add_or_delete = -1

	if add_c < -5:
#		add_c = 1.0
		add_or_delete = 1
#
	add_c += 0.01 * add_or_delete
	rotation_ += 0.01 * add_c
	rotation = rotation_


func launch_bullets():
	for i in trajectory_count:
		color_index = wrapi(color_index + 1, 1, colors.size())
		
		var bullet = bullet_scene.instantiate() as Bullet
		bullet.color = Color.html(colors[color_index])
		bullet.position = global_position
		bullet.init_rotation = TAU / trajectory_count * i + rotation
		bullets_pool.add_child(bullet)


func _on_timer_timeout():
	launch_bullets()

extends KinematicBody2D

signal death_signal
signal collect_signal
var speed = 200
var cur_vec = position

func _ready():
	add_to_group("coins")

func _physics_process(delta):
	position = position.move_toward(Vector2(0, position.y), delta * speed)

func kill():
	queue_free()
	emit_signal("death_signal")

func collect():
	emit_signal("collect_signal")
	queue_free()

func _on_HitDetector_area_entered(area):
	if area.get_name() == "TrainHitBox":
		collect()


extends KinematicBody2D

signal collect_signal
var speed = 200
var cur_vec = position

func _ready():
	add_to_group("coins")

func _physics_process(delta):
	position = position.move_toward(Vector2(0, position.y), delta * speed)

func collect():
	emit_signal("collect_signal")
	queue_free()

func _on_HitDetector_area_entered(area):
	if area.get_name() == "TrainHitBox":
		collect()


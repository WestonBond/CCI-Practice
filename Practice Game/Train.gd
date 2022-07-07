extends KinematicBody2D

func _ready():
	pass

# TODO: Add functionality for moving up and down to other tracks
var speed = 500
var final_vec = Vector2(0,0)
var is_top = false
var is_bot = false
var in_motion = false

func kill():
	get_tree().change_scene("res://DeathScreen.tscn")

func _physics_process(delta):
	if position == Vector2(position.x, 419.446014):
		is_bot = true
	else:
		is_bot = false
	if position == Vector2(position.x, 119.446014):
		is_top = true
	else:
		is_top = false
	if Input.is_action_just_pressed("move_down") and is_bot == false and in_motion == false:
		final_vec = Vector2(self.global_position.x,self.global_position.y+150)
	if Input.is_action_just_pressed("move_up") and is_top == false and in_motion == false:
		final_vec = Vector2(self.global_position.x,self.global_position.y-150)
	if final_vec != Vector2(0,0):
		in_motion = true
		position = position.move_toward(final_vec, delta * speed)
	if position == final_vec:
		in_motion = false
	
	if Input.is_action_just_pressed("kill_button"):
		kill()

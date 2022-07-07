extends RigidBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite.playing = false
	var rock_types = $AnimatedSprite.frames.get_animation_names()
	$AnimatedSprite.animation = rock_types[randi() % rock_types.size()]


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_VisibilityNotifier2D_screen_exited():
	queue_free() # Replace with function body.


func _on_Boulder_body_entered(body):
	hide()
	emit_signal("hit") # Replace with function body.

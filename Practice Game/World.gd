extends Node2D
export(PackedScene) var rock_scene

var score

func _ready():
	randomize()
	new_game() 
	

func new_game():
	score = 0
	$StartTimer.start()
	




func _on_StartTimer_timeout():
	$RockTimer.start()
	$ScoreTimer.start()


func _on_ScoreTimer_timeout():
	score += 1 


func _on_RockTimer_timeout():
	var rock = rock_scene.instance()
	rock.position.x = 600
	rock.position.y = (randi() % 3) * 10
	add_child(rock)

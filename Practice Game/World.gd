extends Node2D
export(PackedScene) var rock_scene

var score
var coin_count = 0
var rng = RandomNumberGenerator.new()

func _ready():
	randomize()
	new_game() 
	

func new_game():
	score = 0
	coin_count = 0
	$StartTimer.start()

func _on_StartTimer_timeout():
	$RockTimer.start()
	$ScoreTimer.start()

func _on_ScoreTimer_timeout():
	score += 1 

func _on_RockTimer_timeout():
	var rock = rock_scene.instance()

	rock.position.x = rng.randf_range(300.0, 800.0)
	rock.position.y = (randi() % 3) * 10
	add_child(rock)

func _on_Coin_collect_signal():
	var coin_scene = load("res://Coin.tscn")
	var coin_instance = coin_scene.instance()
	coin_instance.position = Vector2(642.058, 280.316)
	coin_instance.connect("collect_signal", self, "_on_Coin_collect_signal")
	add_child(coin_instance)
	coin_count += 1
	Global.coins += 1

func _on_Train_death_signal():
	get_tree().call_group("coins", "free")


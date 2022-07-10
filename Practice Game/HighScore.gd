extends Label

# Called when the node enters the scene tree for the first time.
func _ready():
	self.text = "High Score: " + str(Global.coins)
	Global.coins = 0

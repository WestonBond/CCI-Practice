extends ParallaxBackground

var scrolling_speed = -200

#Makes screen scroll based on predefined scrolling speed
func _process(delta):
	scroll_offset.x += scrolling_speed * delta


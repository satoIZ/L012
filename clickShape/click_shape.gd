extends Area2D

var lifeTime:float = 1.0

func setPos(x, y):
	position = Vector2(x, y)

var timer1:float
func _cliclShapeDel(delta):
	timer1 += delta	
	if timer1 > lifeTime:
		queue_free()
		
func _process(delta):
	_cliclShapeDel(delta)

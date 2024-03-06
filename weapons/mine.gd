extends Area2D

# 移動方向
var velocity = Vector2()

# 開始
func start(x, y, deg, speed):
	position = Vector2(x, y) #発生箇所
	velocity.x = speed * cos(deg_to_rad(deg))
	velocity.y = speed * -sin(deg_to_rad(deg))


func _physics_process(delta):
	#position += velocity * delta
	pass


func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()
	pass # Replace with function body.

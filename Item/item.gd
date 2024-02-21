extends Area2D
var Im_X:float
var Im_Y:float

#アイテムのセット
func setPos(x, y):
	position = Vector2(x, y)
	Im_X = x
	Im_Y = y
	

var velocity = Vector2()
func _process(delta):
	#アイテムの落下
	velocity.y = 100
	position += velocity * delta

#クリックした場合消える
func _on_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		# マウスの入力があった
		if event.is_pressed():
			# オブジェクトを消す
			queue_free()

#画面外で削除
func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()
	pass # Replace with function body.

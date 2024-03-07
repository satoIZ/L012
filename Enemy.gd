extends Area2D

func setPos(x, y):
	position = Vector2(x, y)
	em_X = x
	em_Y = y
func _on_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		# マウスの入力があった
		if event.is_pressed():
			# オブジェクトを消す
			queue_free()
			Common.emCount -=1

#弾の設定
var Bullet   = preload("res://bullet.tscn")
var count2:int
var degcount:float
var em_X:float
var em_Y:float

func _physics_process(delta):
		#pass

	count2 += 1
	if count2 == 1:
		var bullet = Bullet.instantiate()
		bullet.start(-90,  100)

		add_child(bullet) #ここで作成するとEnemyが消されると弾も消える。
		
		# ルートノードを取得
		#bullet.setPos(em_X, em_Y)
		#Common.bullets.add_child(bullet)
		await get_tree().create_timer(1).timeout
		count2 = 0
		
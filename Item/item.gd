extends Area2D
var Im_X:float
var Im_Y:float

#アイテムのセット
func setPos(x, y,ItemName):
	position = Vector2(x, y)
	Im_X = x
	Im_Y = y
	var label = Label.new()
	label.text = ItemName
	label.add_theme_color_override("font_color", Color(1, 0, 0, 1))
	label.add_theme_font_size_override("font_size", 50)
	
	add_child(label)

	ItemName_del = ItemName

var velocity = Vector2()
var ItemName_del
func _process(delta):
	#アイテムの落下
	velocity.y = 100
	position += velocity * delta

#クリックした場合消える
func _on_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		# マウスの入力があった
		if event.is_pressed():
			
			#取得したアイテムをカウント
			#print(str(ItemName_del))
			if str(ItemName_del).find("ItemA")>=0:
				Global.ItemAcnt +=1
			elif str(ItemName_del).find("ItemB")>=0:
				Global.ItemBcnt +=1
			elif str(ItemName_del).find("ItemC")>=0:
				Global.ItemCcnt +=1
								
			# オブジェクトを消す
			queue_free()

#画面外で削除
func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()
	pass # Replace with function body.

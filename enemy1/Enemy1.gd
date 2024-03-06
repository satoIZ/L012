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

#---------弾の設定---------
var Bullet   = preload("res://enemy1/bulletE1.tscn")
var count2:int
var degcount:float #射出角度の変数
var em_X:float
var em_Y:float

#--------機雷-------------
var mine = preload("res://weapons/mine.tscn")
var count_m:int
#var degcount:float
var em_X2:float
var em_Y2:float

func _physics_process(delta):

	#----------弾-----------	
	count2 = count2 + 1		
	if count2 == 1:
		#for i in range(1):
		for i in range(2):
			pass
			#degcount += 10 +delta*10 #発射角度
			degcount +=10
			bullet(position.x,position.y,-90+degcount, 100, 1)
		await get_tree().create_timer(0.5).timeout
		count2 = 0

	#---------機雷-----------
	count_m = count_m + 1		
	if count_m == 1:
		#mineSet(position.x,position.y,-90+degcount, 100, 1)
		await get_tree().create_timer(0.5).timeout
		#count_m = 0

#----------------------------------------------
# 弾を撃つ
var bcnt = 0
func bullet(em_X,em_Y,deg, speed, delay=1):
	if delay > 0:
		# 遅延して発射する
		await get_tree().create_timer(delay).timeout

	deg = get_aim(self)
	
	var bullet = Bullet.instantiate()
	bullet.start(0, 0, deg, speed)
	bcnt += 1
	bullet.name = "bullet" + str(bcnt)
	# ルートノードを取得
	add_child(bullet)
	#print(bullet.name)

#----------------------------------------------
# 機雷設置
var mcnt = 0
func mineSet(em_X,em_Y,deg, speed, delay=1):
	if delay > 0:
		# 遅延して発射する
		await get_tree().create_timer(delay).timeout

	deg = get_aim(self)
	
	var mine = mine.instantiate()
	mine.start(200, 200, deg, speed)
	bcnt += 1
	mine.name = "mine" + str(bcnt)
	# ルートノードを取得
	add_child(mine)
	#print(bullet.name)
	
#狙いを付ける

var is_set_target = false
var last_target = Vector2()
var target = null


func get_aim(obj):
	target = Common.addP1
	if is_set_target == false:
		# ターゲットが存在しない場合はマウス位置
		last_target.x = get_viewport().get_mouse_position().x
		last_target.y = get_viewport().get_mouse_position().y
	elif is_instance_valid(target) == false:
		pass # 無効なインスタンスの場合は前回設定した座標
	else:
		# インスタンスから取得可能
		last_target.x = target.position.x
		last_target.y = target.position.y
	

	var dx = last_target.x - obj.position.x	
	var dy = last_target.y - obj.position.y	

	return rad_to_deg(atan2(-dy, dx))

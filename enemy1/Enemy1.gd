extends Area2D

var hp:int = 10
var maxhp:float = 10 # 最大HP 

func setPos(x, y):
	position = Vector2(x, y)
	em_X = x
	em_Y = y
#func _on_input_event(viewport, event, shape_idx):
	#if event is InputEventMouseButton:
		## マウスの入力があった
		#if event.is_pressed():
			## オブジェクトを消す
			##queue_free() #シェイプとの接触で削除
			#Common.emCount -=1

#弾の設定
var Bullet   = preload("res://enemy1/bulletE1.tscn")
var count2:int
var degcount:float
var em_X:float
var em_Y:float



func _ready():

	$"gauge".max_value =maxhp
	$"gauge/Label".text = "Hp:" + str(hp)

	# HPバー更新
	_gauge()
	
var Bnum:int = 0
func _physics_process(delta):
	
	count2 = count2 + 1		
	if count2 == 1:
		#for i in range(1):
		for i in range(1):
			Bnum += 1
			pass
			#degcount += 10 +delta*10 #発射角度
			degcount +=10
			bullet(position.x,position.y,-90+degcount, 100,Bnum, 1)
		await get_tree().create_timer(0.5).timeout
		count2 = 0

# 弾を撃つ
var bcnt = 0
func bullet(em_X,em_Y,deg, speed,Bnum, delay=1):
	if delay > 0:
		# 遅延して発射する
		await get_tree().create_timer(delay).timeout
	
	var bullet = Bullet.instantiate()
	bullet.start(position.x, position.y, deg, speed)
	#bullet.start(0, 0, deg, speed)	
	bcnt += 1
	bullet.name = "bullet" + str(bcnt) +str(Bnum)
	# ルートノードを取得
	$"..".add_child(bullet)
	#print(bullet.name)



func _on_area_entered(area):
	if "clickShape" in area.name:		

		hp -= 1
		
		if hp == 0:
			queue_free() #out

	# HPバー更新
	_gauge()
		
	pass # Replace with function body.

func _gauge():
	# HPバー更新
	var hpbar:TextureProgressBar = $"gauge"
	var hpPer = _hpPer()
	hpbar.value = maxhp * hpPer
	
	hpbar.tint_progress = lerp(Color.YELLOW, Color.YELLOW, hpPer)
	hpbar.tint_under = lerp(Color.RED, Color.RED, hpPer)
	#hpbar.tint_over = lerp(Color.WHITE, Color.WHITE, hpPer)
	$"gauge/Label".text = "Hp:" +"%4.0f" %  hp
	if hp <= 0:
		$"gauge/Label".text = "Hp:0"

func _hpPer():
	return 1.0 * hp / maxhp;

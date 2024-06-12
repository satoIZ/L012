extends Node2D

#enemyの設定
var Enemy = preload("res://enemy1/enemy1.tscn")
var xPos = 250
var yPos = 100

#アイテム発生用に追加
var Item = preload("res://Item/item.tscn")
var ItemFlag:bool = false
var iniFlag:bool = true


#UIの設定
var UI = preload("res://UI/hud.tscn")
#@onready var hud_lab = $HUD/VBox/Label # 追加
#var cross = load("res://mouseCorsor.png")
func _ready():
	iniFlag = true

	var addUI = UI.instantiate()
	add_child(addUI)
	#print(addUI)
	$HUD/VBox/Label.text = "stage:1"


	#Input.set_custom_mouse_cursor(cross)
	
var Items = ["ItemA","ItemB","ItemC"]

var stageCnt:int = 1

#時間の表示
var elapsed_time:float

func _process(delta):
	#時間
	elapsed_time += delta	
	$HUD/VBox/elapsed_time.text = "経過時間"+"%7.1f" % elapsed_time	

	var cnt = 0 #enemyのカウント
	
	#-----ツリーのノード名を検索
	for child in get_children():
		#print(child.name)
		if "Enemy" in child.name:
			cnt += 1
			#print("Enemy" + str(cnt))
	#print("個数：" + str(cnt))
	if cnt == 0:
		#print("NoEnemy" )
		pass
	#----------------------
	
	#----エネミーが0になった場合にエネミーをスポーンする
	if cnt == 0:
	#if Common.emCount == 0:
		for i in range(5):
			var Enemy = Enemy.instantiate()
			var enemy_x = randi_range(-3, 5)
			var enemy_y = randi_range(-2, 2)			
			Enemy.setPos(position.x + enemy_x*100 + 450, enemy_y*100 + 300)
			#Enemy.setPos(position.x + i*xPos+200, position.y + yPos)			
			Enemy.name = "Enemy" + str(i)
			self.add_child(Enemy)

			#Common.emCount += 1
			
		#初回にアイテムを作成しない。
		if iniFlag == true:
			ItemFlag = false
			iniFlag = false
		else:
			ItemFlag = true

	#----エネミーが0になった場合アイテムをスポーンする
	if ItemFlag == true:
	#if Common.emCount == 0:
		for i in range(1):
			var Item = Item.instantiate()
			var item_x = randi_range(1, 9)
			#print(item_x*100)
			Item.name = Items[randi_range(0, 2)]			
			Item.setPos( item_x*100, position.y + yPos+200,Item.name)
			#Item.name = "Item" + str(i)			
			self.add_child(Item)
	
		ItemFlag = false
	
		#ステージ番号を進める
		stageCnt += 1
		$HUD/VBox/Label.text = "stage:" + str(stageCnt)
	
	#-----ツリーのノード名を検索
	for child in get_children():
		#print(child.name)
		if "Item" in child.name:
			cnt += 1
			#print("Item:" + child.name)
	#print("個数：" + str(cnt))
	if cnt == 0:
		#print("NoEnemy" )
		pass
	#----------------------

	$HUD/VBox/ItemA.text = "ItemA:" + str(Global.ItemAcnt)
	$HUD/VBox/ItemB.text = "ItemB:" + str(Global.ItemBcnt)
	$HUD/VBox/ItemC.text = "ItemC:" + str(Global.ItemCcnt)


var corsor_x:float
var corsor_y:float
var leftPressFlag:bool = false

func _input(event):
   # Mouse in viewport coordinates.
	if event is InputEventMouseButton:
		print("Mouse Click/Unclick at: ", event.position)
	elif event is InputEventMouseMotion:
		print("Mouse Motion at: ", event.position)

   # Print the size of the viewport.
	print("Viewport Resolution is: ", get_viewport().get_visible_rect().size)

	if Input.is_action_pressed("left_click"):
	#if event.is_action_pressed("left_click"):		
		# 左クリックの場合の処理
		print("左クリック")
		corsor_x = event.position.x
		corsor_y = event.position.y
		_clickShapeAdd()
		leftPressFlag = true
		pass

#オート連射
	if event is InputEventMouseMotion:
		corsor_x = event.position.x
		corsor_y = event.position.y
		_clickShapeAdd()


#clickShapeの設定
var clickShape = preload("res://clickShape/click_shape.tscn")
var i:int
func _clickShapeAdd():

		var clickShape = clickShape.instantiate()
		
		clickShape.setPos(corsor_x,corsor_y)
		#Enemy.setPos(position.x + i*xPos+200, position.y + yPos)			
		i += 1
		clickShape.name = "clickShape" + str(i)
		self.add_child(clickShape)

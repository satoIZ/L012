extends Node2D

var xPos = 250
var yPos = 100
var Enemy = preload("res://enemy1/enemy1.tscn")
#アイテム発生用に追加
var Item = preload("res://Item/item.tscn")
var ItemFlag:bool = false
var iniFlag:bool = true
func _ready():
	iniFlag = true
	
func _process(delta):

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
	
	#----エネミーが0になった場合にスポーンする
	if cnt == 0:
	#if Common.emCount == 0:
		for i in range(3):
			var Enemy = Enemy.instantiate()
			Enemy.setPos(position.x + i*xPos+100, position.y + yPos)
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
			var item_x = randi_range(0, 10)
			print(item_x*100)
			Item.setPos( item_x*100, position.y + yPos+200)
			Item.name = "Item" + str(i)
			self.add_child(Item)
	
		ItemFlag = false
	
	

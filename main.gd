extends Node2D

var xPos = 250
var yPos = 100
var Enemy = preload("res://enemy.tscn")

func _ready():
	
	Common.bullets = $Bullets
	
	
func _process(delta):

	#var cnt = 0 #enemyのカウント
	#
	##-----ツリーのノード名を検索
	#for child in get_children():
		##print(child.name)
		#if "Enemy" in child.name:
			#cnt += 1
			##print("Enemy" + str(cnt))
	#print("個数：" + str(cnt))
	#if cnt == 0:
		##print("NoEnemy" )
		#pass
	##----------------------
	
	#----エネミーが0になった場合にスポーンする
	#if cnt == 0:
	if Common.emCount == 0:
		for i in range(3):
			var Enemy = Enemy.instantiate()
			Enemy.setPos(position.x + i*xPos+100, position.y + yPos)
			Enemy.name = "Enemy" + str(i)
			self.add_child(Enemy)
			
			Common.emCount += 1

			#count2 += 1
			#if count2 == 1:
			
			#for ii in range(3):			
				#await get_tree().create_timer(1).timeout
				#addBullet(position.x + i*xPos+100, position.y + yPos)
				
				#count2 = 0
#enemyから弾を射出
#弾の設定
#var Bullet   = preload("res://bullet.tscn")
#var count2:int
#var degcount:float
#var em_X:float
#var em_Y:float

#func addBullet(x,y):
#
	##count2 += 1
	##if count2 == 1:
		#var bullet = Bullet.instantiate()
		#bullet.start(-45,  100)
		#bullet.setPos(x,y)
		## ルートノードを取得
		#add_child(bullet)
		#await get_tree().create_timer(1).timeout
		#count2 = 0
		

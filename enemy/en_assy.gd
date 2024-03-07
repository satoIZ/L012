extends Node2D
var xPos = 250
var yPos = 100
var Enemy = preload("res://enemy/enemy.tscn")

func _ready():
	
	#Common.bullets = $EnAssy/Bullets #mainから参照する場合
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
			Enemy.setPos(position.x + i*xPos+100, position.y + i*yPos)
			Enemy.name = "Enemy" + str(i)
			self.add_child(Enemy)
			
			Common.emCount += 1


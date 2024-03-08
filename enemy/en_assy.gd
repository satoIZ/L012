extends Node2D

#enemyの設定値
#位置データ　x,y
#
var posdata = [
[
[100,100],
[200,200],
[300,300]
],
[
[150,150],
[250,250],
[350,350]
]
]
var tranTime=[
[0.0],
[5.0]
]
var pastTime:float
var pastTime2:float

var xPos = 250
var yPos = 100
var Enemy = preload("res://enemy/enemy.tscn")

func _ready():
	#print(posdata[0][0])

	#Common.bullets = $EnAssy/Bullets #mainから参照する場合
	Common.bullets = $Bullets
	
#var cnt = 0 #enemyのカウント
var cnt_ii:int
var flag1:bool
var flag2:int
var flag3:int
var checkTime:float
func _process(delta):


	##-----ツリーのノード名を検索
	#for child in get_children():
		##print(child.name)
		#if "Enemy" in child.name:
			#cnt += 1
			#print("Enemy" + str(cnt))
	##print("個数：" + str(cnt))
	#if cnt == 0:
		##print("NoEnemy" )
		#pass
	##----------------------
	
	#----エネミーが0になった場合にスポーンする
	#if cnt == 0:
	pastTime += delta
	#print("%7.3f" % pastTime)

	pastTime2 = float("%7.0f" % pastTime)
	#print(pastTime2)
	if  checkTime != pastTime2:
		checkTime = pastTime2
		flag2 += 1

	#print(checkTime,":",flag2)
	
	#if pastTime >= 2 || flag1 == false:
		#flag1 = true
		#flag2 +=1
#
	#if pastTime >= 3 || flag1 == true:
		#flag1 = true
	#
	
	
	if Common.emCount == 0:
		
		#for ii in range(1):
		#for ii in posdata:
			#await get_tree().create_timer(1.0).timeout
				
			#print(tranTime[1][0])
			#print(pastTime)
			print(flag3,":",flag2)
			if  flag3 != flag2:
				flag3 = flag2
			
			#if flag2 <= 1:
				#flag2 = 1
				
			#if float(tranTime[cnt_ii][0]) <= float(pastTime) || cnt_ii == 0:
				#flag1 == true
				
				#cnt_ii += 1
				#for i in range(5):
				if flag2 <= 2:
					for i in posdata[flag2-1]:			
						var Enemy = Enemy.instantiate()
						#Enemy.setPos(position.x + i*xPos+100, position.y + i*yPos)
						Enemy.setPos(position.x + i[0],  i[1])			
						Enemy.name = "Enemy" + str(i)
						self.add_child(Enemy)
						
						Common.emCount += 1


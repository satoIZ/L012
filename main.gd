extends Node2D

var EnemyA1 = preload("res://enemy1/enemyA1.tscn")

#var Player = preload("res://Player/player.tscn")

func _ready():
		var EnemyA1 = EnemyA1.instantiate()
		#EnemyA1.setPos(position.x + i*xPos+100, position.y + yPos)
		#EnemyA1.name = "Enemy" + str(i)
		self.add_child(EnemyA1)

		var addP1 = Common.Player.instantiate()
		self.add_child(addP1)
		Common.addP1_x = addP1.position.x
		Common.addP1_y = addP1.position.y

extends Node2D

var target = preload("res://target/target.tscn")

func _ready():
	#targetの設置
	var target = target.instantiate()
	target.position = Vector2(500,500)
	self.add_child(target)
	Bullet2Ex.set_target($Target)

func _process(delta):
	pass


extends Node2D

var target = preload("res://target.tscn")

func _ready():
	#targetの設置
	var target = target.instantiate()
	target.position = Vector2(500,500)
	self.add_child(target)

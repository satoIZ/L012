extends Node

#-------エイムの設定
var target = null
var is_set_target = false
var last_target = Vector2()

func set_target(obj):
	target = obj
	is_set_target = true
	
func get_aim(obj):
	#print(obj.name)
	#print(target.name)
	#print(obj.name)
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
	

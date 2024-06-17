extends Node2D

func _ready() -> void:
	_LineGene($Path2D,-100)

	$"Path2D/gauge".max_value =maxhp
	$"Path2D/gauge/Label".text = "Hp:" + str(hp)

	# HPバー更新
	_gauge()

var posX:float
var posY:float
func _process(delta: float) -> void:
	$Path2D/PathFollow2D.progress_ratio += 0.1 * delta

	posX = $Path2D/PathFollow2D/Area2D/CollisionShape2D.global_position.x
	posY = $Path2D/PathFollow2D/Area2D/CollisionShape2D.global_position.y
	print(posX,":",posY)

	$Path2D/gauge.global_position.x = posX
	$Path2D/gauge.global_position.y = posY+20
	
func _LineGene(pathName,layZ):
	var line = Line2D.new()
	line.z_index = layZ
	line.width = 1
	for point in pathName.curve.get_baked_points():
		line.add_point(point)
	add_child(line)

#Hpゲージ
var hp:int = 10
var maxhp:float = 10 # 最大HP 

func _gauge():
	# HPバー更新
	var hpbar:TextureProgressBar = $"Path2D/gauge"
	var hpPer = _hpPer()
	hpbar.value = maxhp * hpPer
	
	hpbar.tint_progress = lerp(Color.YELLOW, Color.YELLOW, hpPer)
	hpbar.tint_under = lerp(Color.RED, Color.RED, hpPer)
	#hpbar.tint_over = lerp(Color.WHITE, Color.WHITE, hpPer)
	$"Path2D/gauge/Label".text = "Hp:" +"%4.0f" %  hp
	if hp <= 0:
		$"Path2D/gauge/Label".text = "Hp:0"

func _hpPer():
	return 1.0 * hp / maxhp;

func _on_area_2d_area_entered(area):
	print(area.name)
	if "bullet" in area.name:		

		hp -= 1
		
		if hp == 0:
			queue_free() #out
			
	if "Enemy" in area.name:		

		hp -= 1
		
		if hp == 0:
			queue_free() #out

	if "Area" in area.name:		

		hp -= 1
		
		if hp == 0:
			queue_free() #out

	# HPバー更新
	_gauge()

extends Node2D

func _ready():
	Dialogic.start("timeline_1")
	# start_game()


func _process(delta):
	pass

func start_game():
	$Camera2D.moviment = true
	$Hud_cams.visible = false

func cams(visibility):
	# $Cameras.global_position = $Camera2D.global_position
	$Hud_cams.visible = visibility
	$Camera2D.moviment = !($Camera2D.moviment)

func _on_show_cams_pressed():
	cams($Camera2D.moviment)

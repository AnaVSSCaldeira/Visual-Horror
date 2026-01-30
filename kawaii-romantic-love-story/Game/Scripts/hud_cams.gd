extends CanvasLayer

func _ready():
	for button in get_children():
		if button.get_class() == "TextureButton":
			button.pressed.connect(func(): _on_button_pressed(button))

func _on_button_pressed(button):
	$Camera_interface.texture = load("res://Game/Images/UI/Cam_video_"+button.name+".png")
	# $Camera.animation = button.name
    
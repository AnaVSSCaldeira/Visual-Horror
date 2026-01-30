extends Camera2D

@export var move_speed: float = 400.0
@export var border_size: int = 300
@export var background: Sprite2D

var moviment
var left_limit : float
var right_limit : float

func _ready() -> void:
	
	# Obtém o tamanho real do background considerando a escala global
	var background_width := background.texture.get_width() * background.global_scale.x

	# Tamanho da largura da tela
	var screen_width := get_viewport_rect().size.x

	# Centro do background (independente da posição dele)
	var bg_center_x := background.global_position.x

	# Limites da câmera
	left_limit = bg_center_x - (background_width/2) + (screen_width/2)
	right_limit = bg_center_x + (background_width/2) - (screen_width/2)

func _process(delta: float) -> void:

	if moviment:
		#isso so funciona se nao estiver nas cameras
		var mouse_x := get_viewport().get_mouse_position().x
		var screen_width := get_viewport_rect().size.x

		if mouse_x < border_size:
			global_position.x -= move_speed * delta
		elif mouse_x > screen_width - border_size:
			global_position.x += move_speed * delta

		# Funcao clamp:
		# 1. Se o valor for menor que o mínimo: retorna o mínimo
		# 2. Se o valor for maior que o máximo: retorna o máximo
		# 3. Se o valor estiver entre o mínimo e o máximo: retorna o próprio valor
		global_position.x = clamp(global_position.x, left_limit, right_limit)

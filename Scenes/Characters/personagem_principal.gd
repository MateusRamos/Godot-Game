extends CharacterBody2D

@onready var animated_sprite = $AnimatedSprite2D  # Referência ao AnimatedSprite2D
var speed = 500

func _ready():
	$"../Map_pré_player/Hidden_Cozinha".visible = true
	$"../map_pós_player/Hidden_Cozinha".visible = true
	animated_sprite.play("Idle")  # Certifique-se de que há uma animação chamada "idle" no AnimatedSprite2D

func _process(delta):
	var input_vector = Vector2.ZERO

	# Captura das entradas de movimento
	if Input.is_action_pressed("ui_right"):
		input_vector.x += 1
	if Input.is_action_pressed("ui_left"):
		input_vector.x -= 1
	if Input.is_action_pressed("ui_down"):
		input_vector.y += 1
	if Input.is_action_pressed("ui_up"):
		input_vector.y -= 1

	# Normalizar a entrada e aplicar a velocidade
	velocity = input_vector.normalized() * speed

	# Mover o personagem
	move_and_slide()

	# Ajustar a direção da animação se estiver se movendo horizontalmente
	if velocity.x > 0:
		animated_sprite.flip_h = false  # Para a direita
	elif velocity.x < 0:
		animated_sprite.flip_h = true  # Para a esquerda



func _on_cozinha_body_entered(body: Node2D) -> void:
	$"../Map_pré_player/Hidden_Cozinha".visible = false
	$"../map_pós_player/Hidden_Cozinha".visible = false

func _on_cozinha_body_exited(body: Node2D) -> void:
	$"../Map_pré_player/Hidden_Cozinha".visible = true
	$"../map_pós_player/Hidden_Cozinha".visible = true

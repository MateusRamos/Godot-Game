extends CharacterBody2D

var Controller = preload("res://controller.gd")
var MeuController
@onready var animated_sprite = $AnimatedSprite2D  # Referência ao AnimatedSprite2D
var speed = 900

func _ready():
	MeuController = MeuScript.new()
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





#Fazer parede da cozinha sumir
func _on_cozinha_body_entered(body: Node2D) -> void:
	$"../Mapa/Hidden_Cozinha".modulate.a = 0.12
	$"../Mapa/Hidden_Cozinha".z_index = 2
func _on_cozinha_body_exited(body: Node2D) -> void:
	$"../Mapa/Hidden_Cozinha".modulate.a = 1
	$"../Mapa/Hidden_Cozinha".z_index = 0

#Fazer parede do financeiro sumir
func _on_financeiro_body_entered(body: Node2D) -> void:
	$"../Mapa/Hidden_Financeiro".modulate.a = 0.12
	$"../Mapa/Hidden_Financeiro".z_index = 2
func _on_financeiro_body_exited(body: Node2D) -> void:
	$"../Mapa/Hidden_Financeiro".modulate.a = 1
	$"../Mapa/Hidden_Financeiro".z_index = 0

#Fazer parede do financeiro sumir
func _on_sala_chefe_body_entered(body: Node2D) -> void:
	$"../Mapa/Hidden_SalaChefe".modulate.a = 0.12
	$"../Mapa/Hidden_SalaChefe".z_index = 2
func _on_sala_chefe_body_exited(body: Node2D) -> void:
	$"../Mapa/Hidden_SalaChefe".modulate.a = 1
	$"../Mapa/Hidden_SalaChefe".z_index = 0

#Fazer parede do Marketing sumir
func _on_marketing_body_entered(body: Node2D) -> void:
	pass
func _on_marketing_body_exited(body: Node2D) -> void:
	pass

#Fazer parede do Hall sumir
func _on_hall_body_entered(body: Node2D) -> void:
	pass
func _on_hall_body_exited(body: Node2D) -> void:
	pass

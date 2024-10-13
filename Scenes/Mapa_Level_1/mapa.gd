extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Hidden_Financeiro.visible = true
	$Hidden_Cozinha.visible = true
	$Hidden_SalaChefe.visible = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

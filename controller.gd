extends Node
class_name MeuScript

func personagem_trocou_de_sala(nodo: Node, nodo_anterior: Node):
		nodo.visible = false
		nodo_anterior.visible = true

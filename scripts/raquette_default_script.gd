extends CharacterBody2D

@export var joueur_numero : int = 1

const SPEED = 200

func _physics_process(delta: float) -> void:
	if Input.is_action_pressed("joueur-" + str(joueur_numero) + "-haut"):
		velocity.y = -SPEED
	elif Input.is_action_pressed("joueur-" + str(joueur_numero) + "-bas"):
		velocity.y = SPEED
	else:
		velocity.y = 0

	move_and_slide()

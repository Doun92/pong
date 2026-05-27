extends CharacterBody2D

@export var joueur_numero : int = 1

const SPEED = 200        # Vitesse fixe en pixels/seconde
var frame_count = 0      # Compteur de frames, sert de minuterie pour l'IA

func _ia_move()-> void:
	var position_balle = GameData.position_ball_y
	if frame_count == 10:
		var position_add = randi_range(-50, 50)
		if position.y > position_add + position_balle:
			velocity.y = -SPEED
		else:
			velocity.y = SPEED

func _physics_process(delta: float) -> void:
	if joueur_numero == 2 and GameData.game_type == "pve":
		_ia_move()
	else:
		# Lecture des inputs clavier pour le joueur humain
		if Input.is_action_pressed("joueur-" + str(joueur_numero) + "-haut"):
			velocity.y = -SPEED
		elif Input.is_action_pressed("joueur-" + str(joueur_numero) + "-bas"):
			velocity.y = SPEED
		else:
			velocity.y = 0
	velocity.x = 0
	move_and_slide()
	
	frame_count += 1
	if frame_count > 10:
		frame_count = 0

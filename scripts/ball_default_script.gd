extends CharacterBody2D

var SPEED = 350 				# Vitesse initiale (var car elle évolue en jeu)
const MAX_SPEED = 700			# Plafond de vitesse
var direction = Vector2(1, 0)	# Vecteur directionnel normalisé

func début_échange(gauche_droite:int) -> void:	
	direction.y = 0			# Repart toujours horizontalement
	SPEED = 350				# Réinitialise la vitesse
	if gauche_droite == 0:
		direction.x = -1	# Vers le joueur 1 (gauche)
	else:
		direction.x = 1		# Vers le joueur 2 (droite)

func _ready() -> void:
	var points = []
	var rayon = 15
	for i in 32:
		var angle = i * (TAU / 32)
		var x = rayon * cos(angle)
		var y = rayon * sin(angle)
		points.append(Vector2(x, y))
	$Polygon2D.polygon = points
	début_échange(randi_range(0, 1))

func _physics_process(delta: float) -> void:
	if GameData.game_type == "pve":
		GameData.position_ball_y = position.y
	
	velocity = direction * SPEED
	move_and_slide()
	if get_slide_collision_count() > 0:
		var collision = get_slide_collision(0)
		var touched_body = collision.get_collider()
		if touched_body.name == "Joueur 1" or touched_body.name == "Joueur 2":
			var diff = position.y - touched_body.position.y
			direction = direction.bounce(collision.get_normal())
			direction.y = diff / 88.0 #88.0 = demi-longueur de la raquettes
			SPEED = min(SPEED * 1.2, MAX_SPEED)
		elif touched_body.name == "Mur-haut" or touched_body.name == "Mur-bas":
			direction = direction.bounce(collision.get_normal())
		$collision_sound.play()

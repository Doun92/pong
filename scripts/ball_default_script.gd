extends CharacterBody2D

var SPEED = 350
const MAX_SPEED = 700
var direction = Vector2(1, 0)

func début_échange(gauche_droite:int) -> void:
	direction.y = 0
	SPEED = 350
	if gauche_droite == 0:
		direction.x = -1
	else:
		direction.x = 1

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

extends Node2D

var score_j1 = 0
var score_j2 = 0

func _end_game(player:String) -> void:
	if player == "p1":
		$final.text = "Player 1 won !"
	elif player == "p2":
		$final.text = "Player 2 won !"
	$Ball.SPEED = 0
	$redo_button.visible = true
	
func _on_goal(body, goal:String) -> void:
	if body.name == "Ball":
		$Ball.position = Vector2(576, 324)
		if goal == "left":
			$Ball.début_échange(0)
			score_j2 = score_j2 + 1
			$"points-j2".text = str(score_j2)
			if score_j2 == 10:
				_end_game("p2")
		elif goal == "right":
			$Ball.début_échange(1)
			score_j1 = score_j1 + 1
			$"points-j1".text = str(score_j1)
			if score_j1 == 10:
				_end_game("p1")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$"points-j1".text = str(score_j1)
	$"points-j2".text = str(score_j2)
	$Arène/"Goal-gauche".body_entered.connect(_on_goal.bind("left"))
	$Arène/"Goal-droite".body_entered.connect(_on_goal.bind("right"))

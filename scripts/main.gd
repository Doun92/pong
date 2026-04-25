extends Node2D

func _on_goal(body, goal:String) -> void:
	if body.name == "Ball":
		$Ball.position = Vector2(576, 324)
		if goal == "left":
			$Ball.début_échange(0)
		elif goal == "right":
			$Ball.début_échange(1)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Arène/"Goal-gauche".body_entered.connect(_on_goal.bind("left"))
	$Arène/"Goal-droite".body_entered.connect(_on_goal.bind("right"))

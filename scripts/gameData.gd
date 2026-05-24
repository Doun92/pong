extends Node

var game_type = ""

var position_ball_y = 0

var musique: AudioStreamPlayer

func _ready():
	musique = AudioStreamPlayer.new()
	add_child(musique)
	musique.stream = preload("res://sons/background/dream-protocol-ping-pong-classic-arcade-game-116818.mp3")
	musique.volume_db = -20
	musique.play()

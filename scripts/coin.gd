extends Area2D
@onready var game_manager: Node = %GameManager
@onready var audio_stream_player_2d: AudioStreamPlayer2D = $AudioStreamPlayer2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer

func _on_body_entered(body: Node2D) -> void:
	print("you gay")
	game_manager.add_Score()
	animation_player.play("coinsfx")
	
	

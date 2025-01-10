extends Node

func _music_on():
	$AudioStreamPlayer.play()
	

func _on_audio_stream_player_finished() -> void:
	$AudioStreamPlayer.play()

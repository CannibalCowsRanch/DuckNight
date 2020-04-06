extends Node2D

var level = 1
var spawn_index = 0

func _ready() -> void:
	$Audio.play()

func _on_Timer_timeout() -> void:
	$Camera2D.shake(0.3,20,20)


func _on_StartTimer_timeout() -> void:
	$Timer.start()

func _on_Audio_finished() -> void:
	$Audio.seek(5.5)
	if level == 1:
		AudioServer.add_bus_effect(0, AudioEffectPhaser.new())
	elif level == 2:
		AudioServer.add_bus_effect(0, AudioEffectChorus.new())
	elif level == 3:
		AudioServer.add_bus_effect(0, AudioEffectReverb.new())
	elif level == 4:
		AudioServer.add_bus_effect(0, AudioEffectDelay.new())
	level += 1
	$Audio.play()

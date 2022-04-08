extends Node
var spike = preload("spike.tscn")
var bird = preload("bird.tscn")

func _on_nextLevelArea_body_entered(body):
	if ($main_character.score == $main_character.neededScore):
		get_tree().change_scene("res://level2.tscn")

func _on_Area2D_body_entered(body):
		if body.name == "main_character":
			get_tree().change_scene("res://main.tscn")

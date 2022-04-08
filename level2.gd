extends Node2D

func _on_gameOverArea_body_entered(body):
	if ($postava.score == $postava.neededScore):
		get_tree().change_scene("res://victory.tscn")

func _on_Area2D_body_entered(body):
	if body.name == "postava":
		get_tree().change_scene("res://level2.tscn")

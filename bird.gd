extends KinematicBody2D

func _process(delta):
	$Area2D/CollisionShape2D/bird.play("flying")

func _on_Area2D_body_entered(body):
	get_tree().quit()

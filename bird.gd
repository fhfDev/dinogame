extends KinematicBody2D

func _process(delta):
	$Area2D/CollisionShape2D/bird.play("flying")

func _on_Area2D_body_entered(body):
	body.GetDamage_Bird()		# je zadeklarovana v KinematicBody2D.gd

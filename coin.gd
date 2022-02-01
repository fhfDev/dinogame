extends KinematicBody2D
func _on_Area2D_body_entered(body):
	if body.has_method("CoinGrabbed"):
		body.CoinGrabbed()			# je zadeklarovana v KinematicBody2D.gd
		queue_free()

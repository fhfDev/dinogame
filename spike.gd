extends KinematicBody2D
export var motion = Vector2()
var speed = 20
const up = Vector2(0,-1)

func _ready():
	$Timer.start()
	motion.y = -speed
	
func _physics_process(delta):
	move_and_slide(motion)
	
func _on_Timer_timeout():
	motion.y *= -1
	$Timer.start()

func _on_Area2D_body_entered(body):
	body.GetDamage_Cactus()			# je zadeklarovana v KinematicBody2D.gd

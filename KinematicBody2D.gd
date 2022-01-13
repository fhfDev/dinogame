extends KinematicBody2D

const spikeNode = preload("spike.tscn")
const birdNode = preload("bird.tscn")

const gForce = 800
const jump = 250
const distance = 2
const increaseOffset = 0.0005

export var speed = 300

var play = 0
var view = 1
var direction = Vector2()

func _ready():
	pass
	
func _physics_process(delta):
	direction.y += gForce*delta
	speed += speed*increaseOffset
	direction.x = speed
	view = 1
	$postavicka.play("pohyb")
	$postavicka.flip_h = false
	
	if Input.is_action_pressed("hore"):
		direction.y = -jump
		direction.x /= distance
		$postavicka.play("vyskok")
	#	$zvuk.play()
	else:
		if direction.y > 0:
			$postavicka.play("pad")
	
	if play == 0: 
		$hudba.play()
		play = 1
		
	#if Input.is_action_pressed("koniec"):
		#get_tree().quit()
	
	#if is_on_floor():
		#if Input.is_action_pressed("vpravo"):
			#direction.x = speed
			#view = 1
			#$postavicka.play("pohyb")
			#$postavicka.flip_h = false
	#	else:
	#		direction.x = 0
	#		$postavicka.play("stoj")
							
	direction = move_and_slide(direction,Vector2(0,-1))
	

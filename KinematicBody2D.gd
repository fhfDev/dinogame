extends KinematicBody2D

const gForce = 800
const jump = 450
const distance = 10
const neededScore = 5

export var speed = 300
export var hp = 100

var play = 0
var direction = Vector2()
var score = 0

func _physics_process(delta):
	direction.y += gForce*delta

	if is_on_floor():
		if Input.is_action_pressed("hore"):
			direction.y = -jump
			direction.x /= distance
			$postavicka.play("vyskok")

		if Input.is_action_pressed("vlavo"):
			direction.x = -speed
			$postavicka.play("pohyb")
			$postavicka.flip_h = true
		elif Input.is_action_pressed("vpravo"):
			direction.x = speed
			$postavicka.play("pohyb")
			$postavicka.flip_h = false
		else:
			direction.x = 0
	
	if play == 0: 
		$hudba.play()
		play = 1
		
	if Input.is_action_pressed("koniec"):
		get_tree().quit()
							
	direction = move_and_slide(direction,Vector2(0,-1))
	
func GetDamage_Cactus():
	hp -= 30
	print("Zostavajuce zivoty: ",hp) 	# debug	
	if (hp <= 0):
		get_tree().change_scene("res://gameOver.tscn")
		
func GetDamage_Bird():
	hp = hp - 10
	print("Zostavajuce zivoty: ",hp) 	# debug	
	if (hp <= 0):
		get_tree().change_scene("res://gameOver.tscn")
	
func CoinGrabbed():
		score += 1
		print("Pocet coinov, ktore mas: ",score)
		#if (score == neededScore):
			#get_tree().change_scene("res://victory.tscn")

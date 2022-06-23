extends KinematicBody2D

signal health_updated
#signal killed()
#signal damage


const SPEED = 200
const GRAVITY = 15
const JUMP_HEIGHT = -450
const FLOOR = Vector2(0,-1)
const FIREBALL = preload("res://scene/Fireball.tscn") 

var velocity = Vector2()
var butterchicken = 0
var mincepie = 0
var steackncheese = 0 
var on_ground = false
var is_attacking = false
var health
var is_dead = false
var is_hurt = false


onready var invulnerability_timer = $Timer 

func _physics_process(delta):
	
	if is_dead == false:

		if Input.is_action_pressed("ui_right"):
			if is_attacking == false || is_on_floor() == false:
				velocity.x = SPEED
				if is_attacking == false:
					$AnimatedSprite.play("Run")
					$AnimatedSprite.flip_h = false
					if sign($Position2D.position.x) == -1:
						$Position2D.position.x *= -1
		elif Input.is_action_pressed("ui_left"):
			if is_attacking == false || is_on_floor() == false:
				velocity.x = -SPEED
				if is_attacking == false:
					$AnimatedSprite.play("Run")
					$AnimatedSprite.flip_h = true
					if sign($Position2D.position.x) == 1:
						$Position2D.position.x *= -1
		else:
			if on_ground == true && is_attacking == false:
				$AnimatedSprite.play("Idle")
			velocity.x = 0
				
		if Input.is_action_pressed("ui_up"):
			if is_attacking == false:
				if on_ground == true:
					velocity.y = JUMP_HEIGHT
					$SoundJump.play()
					on_ground = false

		if Input.is_action_just_pressed("ui_accept") && is_attacking == false:
			if is_on_floor():
				velocity.x = 0
			is_attacking = true
			$AnimatedSprite.play("Attack")
			$SoundShoot.play()
			var fireball = FIREBALL.instance()
			if sign($Position2D.position.x) == 1:
				fireball.set_fireball_direction(1)
			else:
				fireball.set_fireball_direction(-1)
				
			get_parent().add_child(fireball)
			fireball.position = $Position2D.global_position

		velocity.y += GRAVITY
		
		if is_on_floor():
			if on_ground == false:
				is_attacking = false
			on_ground = true
		else:
			if is_attacking == false:
				on_ground = false
				if velocity.y < 0:
					$AnimatedSprite.play("Jump")
				else:
					$AnimatedSprite.play("Fall")

		velocity = move_and_slide(velocity, FLOOR)
		
		if get_slide_count() > 0:
			for i in range(get_slide_count()):
				if "Dragon" in get_slide_collision(i).collider.name:
					dead()
				elif "Lizard" in get_slide_collision(i).collider.name:
					dead()
							
	
func dead():
	is_dead = true
	velocity = Vector2(0,0)
	$AnimatedSprite.play("Dead")
	$CollisionShape2D.set_deferred("disabled", true)
	velocity.y = JUMP_HEIGHT * 0.5
#	$CollisionShape2D.visible = false
	emit_signal("health_updated")
	Input.action_release("ui_right")
	Input.action_release("ui_left")
	$Timer.start()
	
func _on_AnimatedSprite_animation_finished():
	is_attacking = false

func _on_Fallzone_body_entered(body):
	get_tree().change_scene("res://scene/Lose.tscn")
	get_parent().queue_free()
	
func _on_Fallzone2_body_exited(body):
	get_tree().change_scene("res://scene/Lose.tscn")
	get_parent().queue_free()

func add_butterchicken():
	butterchicken += 1

func add_mincepie():
	mincepie += 1
	
func add_steackncheese():
	steackncheese += 1
	


func _on_Timer_timeout():
	get_tree().reload_current_scene()
	




func _on_Player_health_updated():
	get_node("/root/Global").life -= 1
	var life = get_node("/root/Global").life
	if life == 0:
		return_to_menu()
	else:
		_ready()

func return_to_menu():
	get_tree().change_scene("res://scene/Lose.tscn")
	get_parent().queue_free()

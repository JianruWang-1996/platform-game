extends Area2D

const SPEED = 300
var velocity = Vector2()
var direction = 1

func set_fireball_direction(dir):
	direction = dir
	if dir == -1:
		$AnimatedSprite.flip_h = true

func _physics_process(delta):
	velocity.x = SPEED * delta * direction
	translate(velocity)
	$AnimatedSprite.play("shoot")
	

func _on_VisibilityNotifier2D_screen_exited():
	queue_free() #destroyed the fireball


func _on_Fireball_body_entered(body):
	if "Dragon" in body.name:
		body.dead()
	elif "Lizard" in body.name:
		body.dead()
	queue_free()

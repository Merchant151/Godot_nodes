extends Node3D

#export makes vars accessible in the editor 
@export var speed = 50;

#process should work like on update
func _process(delta):
	var velocity = Vector3.ZERO
	if Input.is_action_pressed("right"):
		velocity.x += 1 
	if Input.is_action_pressed("left"):
		velocity.x -= 1
	if Input.is_action_pressed("up"):
		velocity.y += 1 
	if Input.is_action_pressed("down"):
		velocity.y -= 1
	if velocity.length() > 0: 
		velocity = velocity.normalized() * speed
	position += velocity * delta

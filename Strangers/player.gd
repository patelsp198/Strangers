extends Node

var speed = 250
onready var player = get_node("player")
var hasKey = false
var hasKnife = false
onready var position = player.get_pos()

func _ready():
	# Hide mouse
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	set_process(true)
	
func _process(delta):
	# This is necessary for easy access to the players actual position
	# from within other scripts
	position = player.get_pos()
	# Move character
	# The move command is unique to kinematic objects and both moves and checks collision at the same time.
	if(Input.is_action_pressed("moveUp") and !global.isPaused):
		player.move(Vector2(0,-speed * delta))
	if(Input.is_action_pressed("moveDown") and !global.isPaused):
		player.move(Vector2(0,speed * delta))
	if(Input.is_action_pressed("moveLeft") and !global.isPaused):
		player.move(Vector2(-speed * delta,0))
	if(Input.is_action_pressed("moveRight") and !global.isPaused):
		player.move(Vector2(speed * delta,0))
	
	# Set cursor position
	var mousePos = get_node("player/Camera2D").get_global_mouse_pos()
	get_node("cursor").set_global_pos(mousePos)
	# The following line will make the player face the cursor if uncommented
	if(!global.isPaused):
		player.set_rot(player.get_pos().angle_to_point(mousePos))
	if(player.is_colliding()):
		checkCollider()

func checkCollider():
	# Get the node that player is colliding with
	var collider = player.get_collider()
	# If that node is the exit and player has key then change to end scene
	if(collider.get_name() == "exit" && hasKey == true):
		get_tree().change_scene("winScreen.tscn")
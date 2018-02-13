extends KinematicBody2D

var speed = 150
var player
var textBox
var textPanel
var isSpeaking

func _ready():
	# Initialize everything
	player = get_owner().get_node("playerNode")
	textBox = get_node("interactButton/text")
	textPanel = get_node("interactButton/textPanel")
	set_fixed_process(true)

func _fixed_process(delta):
	# If not paused and distance is greater than 130, update position along path
	if(!global.isPaused and !checkDistance()):
		get_parent().set_offset(get_parent().get_offset() + (speed*delta))
		get_node("interactButton").hide()
		isSpeaking = false
	
	# This should only run once each time the npc stops, and resets when it resumes
	elif(!isSpeaking):
		textBox.set_text("Hello!")
		# Rotates the text pieces so that they appear correctly regardless of npc rotation
		textPanel.set_rotation_deg(-self.get_global_rotd())
		textBox.set_rotation_deg(-self.get_global_rotd())
		get_node("interactButton").show()
		isSpeaking = true
	
	# Update panel size to match text
	textPanel.set_size(textBox.get_size())
	textPanel.set_pos(textBox.get_pos())

func checkDistance():
	# Return true if closer than 130, false if not
	if(player.position.distance_to(self.get_global_pos()) < 130):
		return true
	return false

func _on_interactButton_pressed():
	if(checkDistance()):
		updateText()

# This function will at some point update the text according to some conditions
func updateText():
	textBox.set_text("How are you today?")
	textPanel.set_size(textBox.get_size())
	textPanel.set_pos(textBox.get_pos())

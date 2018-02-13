extends StaticBody2D

var openOrClosed = false
var reopen = false
var player

func _ready():
	player = get_owner().get_node("playerNode")


func _on_doorButton_pressed():
	if(openOrClosed == false and checkDistance()):
		set_rotd(90)
		#self.set_pos( Vector2(-525, -660) )
		openOrClosed = true
	elif(openOrClosed == true and checkDistance()):
		set_rotd(0)
		#self.set_pos( Vector2(-560, -727) )
		openOrClosed = false
		
func checkDistance():
	if(player.position.distance_to(self.get_pos()) < 130):
		return true
	return false
	pass
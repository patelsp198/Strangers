extends TextureButton

var player
var ownPos

func _ready():
	player = get_owner().get_node("playerNode")
	pass


func _on_Key_button_down():
	if(player.position.distance_to(self.get_pos()) < 80 and !global.isPaused):
		print(self.get_name() + " collected")
		player.hasKey = true
		hide()
		#key appears in slot one of the inventory
		get_node("/root/baseNode/playerNode/invMenu/itemOne/keySprite").show()


func _on_Knife_button_down():
	if(player.position.distance_to(get_pos()) < 80 and !global.isPaused):
		print(self.get_name() + " collected")
		player.hasKnife = true
		hide()
		#knife appears in slot two of the inventory
		get_node("/root/baseNode/playerNode/invMenu/itemTwo/knifeSprite").show()


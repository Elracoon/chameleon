extends Control

var messages_histoire = [
	"Il était une fois, Arkanthos, le mage noir du royaume . 
Assoiffé de pouvoir, il décida de plonger les royaumes dans le chaos. ",
"Dans sa quête maléfique, 
il s'empara des cinq pierres de pouvoir des mondes élémentaires,
 les éparpillant à travers chaque royaume, 
perturbant ainsi l’équilibre paisible des mondes.",
"Mais au milieu de ce chaos, un héros se dressa.
 Lyrian, le caméléon archer, 
fut choisi par le destin pour restaurer l'harmonie.",
"Parcourir les mondes afin de récupérer les pierres de pouvoir voler 
en combattant les monstres et arrêter 
le plan machiavélique d’Arkanthos.",
"Ainsi commence l'épopée de Lyrian, 
l'archer caméléon, dans sa quête pour sauver les 
mondes élémentaires de l'emprise du mage noir.",
"A vous de jouer !"
]

var typing_speed = .05
var read_time = 7

var current_message = 0
var display = ""
var current_char = 0

var scene_to_load = "res://scene chateau/scene_chateau.tscn"

# Called when the node enters the scene tree for the first time.
func _ready():
	start_dialogue()
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func start_dialogue():
	current_message = 0
	display = ""
	current_char = 0
	
	$next_char.set_wait_time(typing_speed)
	$next_char.start()
	
func stop_dialogue():
	# get_parent().remove_child(self)
	get_tree().change_scene_to_file(scene_to_load)

func _on_next_char_timeout():
	if (current_char < len(messages_histoire[current_message])):
		var next_char = messages_histoire[current_message][current_char]
		display += next_char
		
		$Label1.text = display
		current_char += 1
	else:
		$next_char.stop()
		$next_message.one_shot = true
		$next_message.set_wait_time(read_time)
		$next_message.start()


func _on_next_message_timeout():
	if (current_message == len(messages_histoire) - 1):
		stop_dialogue()
		
	else: 
		current_message += 1
		display = ""
		current_char = 0
		$next_char.start()

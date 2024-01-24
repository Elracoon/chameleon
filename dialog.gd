extends Control

var dialogText : String = "bvisqknviksqnvkisqnviknsqikvniskqbnvisdbvijbvjbqsujmvbmsdjvujdsbvjiulllllllllllllllllllllllllkvddnkvnoqsvbikqspvbsqolvnqsbvsqpmvb sqbvikqsovhnio"
var currentText : String = ""
var textSpeed : float = 0.05
var timer: float = 0.0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	timer += delta
	if timer > textSpeed and currentText.length() < dialogText.length():
		currentText = dialogText.left(currentText.length() + 1)
		timer = 0.0
		update_text()

func update_text():
	$Label.text = currentText

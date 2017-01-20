extends Panel

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var tellerLoopt = false;
var aantalSeconden = 0;
func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	#pass
	get_node("Button").set_text("Start")
	get_node("Timer").connect("timeout",self,"_myTimerTimeout")
	get_node("Button").connect("pressed",self,"_myButtonClick")
	
func _myButtonClick():
	if !tellerLoopt:
		get_node("Button").set_text("Stop")
		get_node("Timer").start();
		aantalSeconden = 0
		get_node("Label").set_text("Tijd:" + str(aantalSeconden) )
	else:
		get_node("Button").set_text("Start")
		get_node("Timer").stop();
		aantalSeconden = 0
		get_node("Label").set_text("Tijd:" + str(aantalSeconden) )
	
	tellerLoopt = !tellerLoopt

func _myTimerTimeout():
	aantalSeconden = aantalSeconden + 1;
	get_node("Label").set_text("Tijd:" + str(aantalSeconden) )
	
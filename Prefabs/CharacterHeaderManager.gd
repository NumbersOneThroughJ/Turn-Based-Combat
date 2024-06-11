extends SubViewport

#editor vars
@export var HealthBar : ProgressBar
@export var HealthLabel : Label
@export var NameLabel : Label
@export var IDLabel : Label

#Variables
var maxHealth : int
var health : int
var charName : String
static var showBar : bool = false

func updateHealthBar():
	HealthBar.max_value = float(maxHealth)
	HealthBar.value = float(health)
	HealthLabel.text = str(health,"/",maxHealth," hp")

func setAllHealth(h: int, maxH : int):
	setMaxHaelth(maxH)
	setHealth(h)
	updateHealthBar()

func setMaxHaelth(maxH : int):
	maxHealth = maxH

func setHealth(H : int):
	health = H

func setName(nam : String):
	charName = nam
	NameLabel.text = charName

func showDetailed(do : bool):
	showBar = do

func setID(i : int):
	IDLabel.text = str("ID:",i)

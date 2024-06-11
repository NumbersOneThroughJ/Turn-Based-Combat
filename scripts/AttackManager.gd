extends Node

#REGISTRY
const REGISTRY = preload("res://scripts/_scriptRegistry.gd")

#preload classes
const CHARQUEUE_CLASS = preload(REGISTRY.CHARQUEUE_CLASS)
const CHARACTERMANAGER_CLASS = preload(REGISTRY.CHARACTERMANAGER_CLASS)
const TURNQUEUE_CLASS = preload(REGISTRY.TURNQUEUE_CLASS)

#Variables
var Protagonists: CHARQUEUE_CLASS
var Antagonists: CHARQUEUE_CLASS
var currentCharacter: CHARACTERMANAGER_CLASS
var TargetCharacter: CHARACTERMANAGER_CLASS

func _init(Protagonists_Arr:Array, Antagonists_Arr:Array):
	Protagonists = CHARQUEUE_CLASS.new(Protagonists_Arr)
	Antagonists = CHARQUEUE_CLASS.new(Antagonists_Arr)

func startAttack(attacker : CHARACTERMANAGER_CLASS):
	currentCharacter = attacker
	attacker.setSubSelected(true)
	if currentCharacter.isAntagonist:
		TargetCharacter = Protagonists.getNext()
	else:
		TargetCharacter = Antagonists.getNext()
	TargetCharacter.setSelected(true)

func cancelAttack():
	if TargetCharacter != null:
		TargetCharacter.setSelected(false)
	currentCharacter.setSelected(true)

func doAttack(turnQueue : TURNQUEUE_CLASS) -> void:
	var targetDead : bool = currentCharacter.attack(TargetCharacter)
	cancelAttack()
	if targetDead:
		turnQueue.removeChar(TargetCharacter)

func nextTarget():
	TargetCharacter.setSelected(false)
	if not currentCharacter.isAntagonist:
		TargetCharacter = Antagonists.getNext()
	else:
		TargetCharacter = Protagonists.getNext()
	TargetCharacter.setSelected(true)

func prevTarget():
	TargetCharacter.setSelected(false)
	if not currentCharacter.isAntagonist:
		TargetCharacter = Antagonists.getPrevious()
	else:
		TargetCharacter = Protagonists.getPrevious()
	TargetCharacter.setSelected(true)

func reload(Protagonists_Arr:Array, Antagonists_Arr:Array):
	Protagonists.reload(Protagonists_Arr)
	Antagonists.reload(Antagonists_Arr)

extends Node3D

#REGISTRY class
const REGISTRY = preload("res://scripts/_scriptRegistry.gd")

#Loading in classes
const TURNQUEUE_CLASS = preload(REGISTRY.TURNQUEUE_CLASS)
const CHARQUEUE_CLASS = preload(REGISTRY.CHARQUEUE_CLASS)
const POSITIONSMANAGER_CLASS = preload(REGISTRY.POSITIONSMANAGER_CLASS)
const CHARACTERMANAGER_CLASS = preload(REGISTRY.CHARACTERMANAGER_CLASS)
const ATTACKMANAGER_CLASS = preload(REGISTRY.ATTACKMANAGER_CLASS)

#Editor Variables
@export var PositionManagerNode : Node
@export var turnTrackerNode : Node2D

#Variables
var PositionManager: POSITIONSMANAGER_CLASS
var TurnOrder: TURNQUEUE_CLASS
var selected: CHARACTERMANAGER_CLASS
var attackManager: ATTACKMANAGER_CLASS
var selectingMode: bool

var nextTurn : int

#Godot Functions
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#TURN ORDER INIT
	TurnOrder = TURNQUEUE_CLASS.new(PositionManagerNode, turnTrackerNode)
	selected = TurnOrder.getNext()
	selected.setSelected(true)
	
	#ATTACK MANAGER INIT
	attackManager = ATTACKMANAGER_CLASS.new(PositionManagerNode.getProtagonists(), PositionManagerNode.getAntagonists())
	
	nextTurn = false

func _process(delta: float) -> void:
	while nextTurn>0:
		switchSelectedToNext()
		nextTurn-=1

func queueTurn():
	nextTurn +=1

#Custom Functions
func switchSelectedToNext():
	selected.setSelected(false)
	selected = TurnOrder.getNext()
	selected.setSelected(true)
	turnTrackerNode.get_children()[0].queueTurn()

func switchSelectedToPrev():
	selected.setSelected(false)
	selected = TurnOrder.getPrevious()
	selected.setSelected(true)

#Attacking
func startAttack():
	attackManager.startAttack(selected)

func cancelAttack():
	attackManager.cancelAttack()

func doAttack():
	attackManager.doAttack(TurnOrder)
	attackManager.reload(PositionManagerNode.getProtagonists(), PositionManagerNode.getAntagonists())
	queueTurn()

func switchTargetToNext():
	attackManager.nextTarget()

func switchTargetToPrevious():
	attackManager.prevTarget()

extends Node3D

#Editor Variables
@export_range(0,20) var turnSpeed :float
@export var blinksPerSec : float

#variabls
var lastDelta : float
var doBlink : bool
@export var doSpin : bool

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	lastDelta = 0

func blink() -> void:
	rotation.y = 0
	lastDelta = 0
	doBlink = true
	doSpin = false

func spin() -> void:
	doSpin = true
	doBlink = false
	visible = true

func stop() -> void:
	visible = false
	doBlink = false
	doSpin = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if doBlink:
		lastDelta = lastDelta+delta
		if lastDelta>(1/blinksPerSec):
			visible = not visible
			lastDelta = 0
	if doSpin:
		rotate(Vector3(0,1,0), -turnSpeed*delta)

extends Node

#REGISTRY
const REGISTRY = preload("res://scripts/_scriptRegistry.gd")

#preload classes
const STATS_CLASS = preload(REGISTRY.STATS_CLASS)

#Editor Variables
@export var Parent: Node3D
@export var HealthBar: ProgressBar

#Variables
var Stats: STATS_CLASS

func _ready() -> void:
	Stats = Parent.getStats()
	
	HealthBar.max_value = Stats.max_Health
	HealthBar.value = Stats.health

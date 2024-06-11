extends Node

#Arrays are of the character Manager type
var AntagonistPositions: Array
var ProtagonistPositions: Array

func _ready() -> void:
	AntagonistPositions = getEntitiesFromSide(get_child(0))
	ProtagonistPositions = getEntitiesFromSide(get_child(1))
	for node in AntagonistPositions:
		node.setEnemy(true)

func getEntitiesFromSide(side:Node3D):
	var Positions = []
	for node in side.get_children():
		var nodeChild = node.get_child(0)
		if nodeChild != null:
			Positions.append(nodeChild)
	return Positions

func getAntagonists():
	AntagonistPositions = getEntitiesFromSide(get_child(0))
	return AntagonistPositions

func getProtagonists():
	ProtagonistPositions = getEntitiesFromSide(get_child(1))
	return ProtagonistPositions

func getAll():
	AntagonistPositions = getEntitiesFromSide(get_child(0))
	ProtagonistPositions = getEntitiesFromSide(get_child(1))
	return ProtagonistPositions + AntagonistPositions

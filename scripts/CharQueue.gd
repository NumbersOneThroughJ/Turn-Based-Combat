#This is a revolving queue for characters
#It will work for anything that has basic character
#  controls.

extends Object

#REGISTRY
const REGISTRY = preload("res://scripts/_scriptRegistry.gd")

#Loading in Classes
const CHARACTERMANAGER_CLASS = preload(REGISTRY.CHARACTERMANAGER_CLASS)
const PositionsManager = preload(REGISTRY.POSITIONSMANAGER_CLASS)

#Variables
var characterArr : Array
var index : int
var maxArr : int

#Godot Event Functions
func _init(Positions: Array):
	characterArr = Positions
	index = -1
	maxArr = characterArr.size()-1

func reload(Positions: Array):
	characterArr = Positions
	index = -1
	maxArr = characterArr.size()-1

#Custom Functions
func getNext():
	index = index+1
	if(index>maxArr) : index = 0
	var target = characterArr[index]
	return target

func getPrevious():
	index = index-1
	if(index<0) : index = maxArr
	var target = characterArr[index]
	return target

extends Node3D

@export var CameraPositionsParent: Node
@export var CameraPositionArr: Array

@export var index: int

func _ready() -> void:
	index = 0
	CameraPositionArr = CameraPositionsParent.get_children()
	print(CameraPositionArr)
	matchPosition(CameraPositionArr[index])

func matchPosition(target: Node3D):
	position = target.position
	rotation = target.rotation

func getNextNode():
	index =  index+1 if ((index+1) < (CameraPositionArr.size())) else 0
	return CameraPositionArr[index]

#func _unhandled_input(event) -> void:
#	if event is InputEventKey:
#		if event.is_pressed() and event.keycode == KEY_SPACE:
#			matchPosition(getNextNode())
#	

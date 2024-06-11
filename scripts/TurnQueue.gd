extends "res://scripts/CharQueue.gd"

var TurnTracker : Node2D

func _init(manager: PositionsManager, turnTrackerNode : Node2D):
	characterArr = manager.getAll()
	index = -1
	maxArr = characterArr.size()-1
	Sort()
	
	TurnTracker = turnTrackerNode.get_children()[0]
	setTurnTracker()

func characterSortTool(char1 : CHARACTERMANAGER_CLASS, char2: CHARACTERMANAGER_CLASS):
	return char2.getStats().speed>char1.getStats().speed

func Sort():
	characterArr.sort_custom(characterSortTool)

func setTurnTracker():
	characterArr[0].setID(TurnTracker.setFirst(characterArr[0].getIconSprite()))
	for i in range(1, characterArr.size()):
		characterArr[i].setID(TurnTracker.addTurn(characterArr[i].getIconSprite()))

func removeChar(target : CHARACTERMANAGER_CLASS):
	TurnTracker.removeTurn(target.id)
	characterArr.remove_at(characterArr.find(target))
	target.free()
	maxArr-=1

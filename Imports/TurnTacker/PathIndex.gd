extends PathFollow2D

var index :int = -1
static var indexCount = 0

func setIndex(i : int) ->void:
	index = i
	indexCount = max(index, indexCount)

func getIndex() -> int:
	return index

func generateIndex() -> int:
	indexCount+=1
	index = indexCount
	return index

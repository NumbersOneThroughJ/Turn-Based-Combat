extends Path3D

#editor variables
@export var speed : float
@export var pathFollower : Sprite3D

#variables
var progress : float


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	progress += speed*delta

func prepareAttack() -> void:
	pass

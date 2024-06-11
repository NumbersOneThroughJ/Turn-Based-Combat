extends Node3D

#REGISTRY
const REGISTRY = preload("res://scripts/_scriptRegistry.gd")

#preload classes
const STATS_CLASS = preload(REGISTRY.STATS_CLASS)

#Editor Variables
@export var managedSprite: Sprite3D
@export var selecterSprite: Sprite3D
@export var icon: Sprite2D
@export var statsNode: Node
@export var infoBar : SubViewport

#Variables
var isAntagonist : bool = false
var id : int

func _ready() -> void:
	updateHealthBar()

func updateHealthBar():
	infoBar.setAllHealth(statsNode.health, statsNode.max_Health)

func setTexture(tex: Texture):
	managedSprite.texture = tex

func setEnemy(isEnemy: bool):
	isAntagonist = isEnemy
	managedSprite.flip_h = isEnemy

func unselect():
	selecterSprite.stop()

func setSubSelected(selected: bool):
	if selected:
		selecterSprite.blink()
	else:
		selecterSprite.stop()

func setSelected(selected: bool):
	#selecterSprite.visible = selected
	if selected:
		selecterSprite.spin()
	else:
		selecterSprite.stop()

func getStats() -> STATS_CLASS:
	return statsNode

#returns true if dead and needs to be removed
func takeDamage(damage : int) -> bool:
	var dead = statsNode.takeDamage(damage)
	updateHealthBar()
	return dead

#returns true if the target needs to be removed
func attack(target) -> bool:
	return target.takeDamage(statsNode.getAttack())

func defend():
	pass

func getIconSprite() -> Texture2D:
	var returnTexture : Texture2D = icon.texture
	return returnTexture

func setID(x : int)->void:
	id = x
	infoBar.setID(id)

func pingTurn()->void:
	pass

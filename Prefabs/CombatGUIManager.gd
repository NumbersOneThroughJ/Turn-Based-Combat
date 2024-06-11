extends Node2D

#REGISTRY class
const REGISTRY = preload("res://scripts/_scriptRegistry.gd")

#Loading in classes
const COMBATCONTROL_CLASS = preload(REGISTRY.COMBATCONTROLS_CLASS)

#Export vars
@export var battleManagerNode : Node #COMBATCONTROL_CLASS
@export var mainControls : Control
@export var TargetingControls : Control
pass

#Main Controls Buttons
func MainControls_on_pass_pressed() -> void:
	pass # Replace with function body.

func MainControls_on_attack_pressed() -> void:
	battleManagerNode.startAttack()
	mainControls.visible = false
	TargetingControls.visible = true

func MainControls_on_previous_pressed() -> void:
	battleManagerNode.switchSelectedToPrev()

func MainControls_on_next_pressed() -> void:
	battleManagerNode.switchSelectedToNext()

#Targeting Controls Buttons
func TargetingControls_on_previous_pressed() -> void:
	battleManagerNode.switchTargetToPrevious()

func TargetingControls_on_next_pressed() -> void:
	battleManagerNode.switchTargetToNext()

func TargetingControls_on_confirm_pressed() -> void:
	battleManagerNode.doAttack()
	TargetingControls_on_back_pressed()

func TargetingControls_on_back_pressed() -> void:
	battleManagerNode.cancelAttack()
	TargetingControls.visible = false
	mainControls.visible = true

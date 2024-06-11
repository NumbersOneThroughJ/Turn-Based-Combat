extends Node

@export var health_rand_min:int
@export var health_rand_max:int
@export var defence_rand_min:int
@export var defence_rand_max:int
@export var attack_rand_min:int
@export var attack_rand_max:int
@export var speed_rand_min:int
@export var speed_rand_max:int

#Editor variables
var max_Health: int
var health: int
var defence: int
var attack: int
var speed: int

func _ready() -> void:
	max_Health = randi_range(health_rand_min,health_rand_max)
	health = max_Health
	attack = randi_range(attack_rand_min,attack_rand_max)
	speed = randi_range(speed_rand_min,speed_rand_max)

func takeDamage(damage : int) -> bool:
	health = health - damage
	return health<=0

func getAttack() -> int:
	return attack

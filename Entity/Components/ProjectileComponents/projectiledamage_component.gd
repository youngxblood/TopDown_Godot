extends Node2D
class_name ProjectileDamageComponent

@export var damage : float = 10.0
@export var number_of_pierce : int = 0


## Returns damage amount
func deal_damage():
	return damage
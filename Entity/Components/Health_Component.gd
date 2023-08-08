extends Node

class_name HealthComponent

@export var max_health : int = 10;
@export var defense_modifier : int = 3;
var current_health : int;

func _ready():
	current_health = max_health;


## Method to change apply damage to the health component
func change_current_health(damage_taken: int):
	current_health -= apply_damage_reduction(damage_taken);


func apply_damage_reduction(damage_to_reduce : int):
	damage_to_reduce -= defense_modifier;
	return damage_to_reduce;
extends Node2D
class_name HealthComponent

signal health_changed(new_health : float); ## Signal that is fired when health changes
signal owner_died; ## Signal that is fired when the owner dies

@export var max_health : float = 10;
@export var defense_modifier : float = 3;
@export var suppress_damage : bool =  false;

var current_health : float;
var owner_is_dead : bool = false;


func _ready():
	initialize_health();


## Method to change apply damage to the health component
func damage_owner(damage_taken: float):
	current_health -= apply_damage_reduction(damage_taken);

	if current_health <= 0:
		owner_is_dead = true;
		kill_owner();


## Method to apply damage reduction (ie. armour)
func apply_damage_reduction(damage_to_reduce : float):
	damage_to_reduce -= defense_modifier;
	return damage_to_reduce;


## Method to heal the owner
func heal_owner(heal_amount : float):
	current_health += heal_amount;
	clamp(current_health, 0, max_health);
	health_changed.emit(current_health);


## Set max health
func set_max_health(new_max_health : float):
	max_health = new_max_health;


## Used to set current health to the maximum health
func initialize_health():
	current_health = max_health;


## Destroys the owner of the Health Component
func kill_owner():
	queue_free();
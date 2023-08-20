extends Node2D
class_name WeaponBase

@onready var projectilethrower_component : ProjectileThrowerComponent = $ProjectileThrower_Component


func fire_weapon():
	if projectilethrower_component:
		projectilethrower_component.spawn_projectile()
extends Area2D
class_name HitboxComponent

@export var projectiledamage_component : ProjectileDamageComponent

func _on_area_entered(area):
	if !area.is_in_group("Hurtbox"):
		return
	print_debug("Hit " + area.get_parent().name)
	if projectiledamage_component:
		var target : BaseCharacter = area.get_owner()
		target.health_component.damage_owner(projectiledamage_component.damage)
		print_debug(target.health_component.current_health)

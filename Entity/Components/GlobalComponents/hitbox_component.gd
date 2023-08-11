extends Area2D
class_name HitboxComponent

@export var projectiledamage_component : ProjectileDamageComponent

func _on_area_entered(area:Area2D):
	if area.is_class("HurtboxComponent"):
		print_debug("Hit " + area.get_parent().name)

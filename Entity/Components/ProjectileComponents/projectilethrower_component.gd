extends Node2D
class_name ProjectileThrowerComponent

@export_file var projectile_location
var string_to_load : String


func spawn_projectile():
	string_to_load = projectile_location
	var PROJECTILE = load(projectile_location)
	if PROJECTILE:
		var projectile = PROJECTILE.instantiate()
		get_tree().current_scene.add_child(projectile)


		projectile.global_position = self.get_parent().global_position;
		projectile.global_position.y -= 15; # Make the daggers spawn higher

		var projectile_rotation = self.global_position.direction_to(get_global_mouse_position()).angle()
		projectile.rotation = projectile_rotation;

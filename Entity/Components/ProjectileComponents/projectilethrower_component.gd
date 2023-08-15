extends Node2D
class_name ProjectileThrowerComponent

@onready var cooldown_timer : Timer = $CooldownTimer

@export_file var projectile_location
var string_to_load : String
var is_off_cooldown : bool = true
var cooldown_time : float = 0.2


## Spawns the projectile when available
func spawn_projectile():
	if !is_off_cooldown: # Early return if on cooldown
		return

	string_to_load = projectile_location
	var PROJECTILE = load(projectile_location)
	if PROJECTILE:
		var projectile = PROJECTILE.instantiate()
		projectile.projectile_owner = self.get_owner()
		get_tree().current_scene.add_child(projectile)


		projectile.global_position = self.get_parent().global_position;
		projectile.global_position.y -= 15; # Make the daggers spawn higher

		var projectile_rotation = self.get_parent().global_position.direction_to(get_global_mouse_position()).angle()
		projectile.rotation = projectile_rotation;
		start_cooldown()


## Start cool down in between spawn_projectile()
func start_cooldown():
	is_off_cooldown = false
	cooldown_timer.wait_time = cooldown_time
	cooldown_timer.start()
	await cooldown_timer.timeout

	# When timer is done
	is_off_cooldown = true
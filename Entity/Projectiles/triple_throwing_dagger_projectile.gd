extends ProjectileBase

@export_file var projectile_location
var string_to_load : String

func _ready():
	super()
	string_to_load = projectile_location
	var PROJECTILE = load(projectile_location)
	if PROJECTILE:		
		var new_projectile = PROJECTILE.instantiate()
		new_projectile.projectile_owner = projectile_owner
		get_tree().current_scene.add_child(new_projectile)

		new_projectile.global_position = global_position;
		# new_projectile.global_position.y -= 150; # Make the daggers spawn higher

		
		var projectile_rotation = self.get_parent().global_position.direction_to(get_global_mouse_position()).angle()
		new_projectile.rotation = projectile_rotation;
	

extends Node2D
class_name ProjectileBase	

@onready var sprite : Sprite2D = $Sprite2D
@onready var lifetime_timer : Timer = $Lifetime_Timer

@export var hitbox_component : HitboxComponent
@export var timeout_time : float = 3

var projectile_owner : BaseCharacter # Used to ensure owner does not get hit by projectile
var projectile_speed = 300


func _ready():
	start_projectile_timeout()


func _physics_process(delta):
	var direction : Vector2 = Vector2.RIGHT.rotated(rotation);
	global_position += projectile_speed * direction * delta;


func destroy_projectile():
	self.queue_free()


## Used to cleanup projectiles after delay for performance
func start_projectile_timeout():
	lifetime_timer.wait_time = timeout_time
	lifetime_timer.start()
	await lifetime_timer.timeout

	# When timer is over
	destroy_projectile()

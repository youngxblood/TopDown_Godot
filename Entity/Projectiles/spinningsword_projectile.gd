extends ProjectileBase

var spin_speed : float = 10

func _physics_process(delta):
	rotate_sword(delta)


func rotate_sword(delta : float):
	self.sprite.rotation += spin_speed * delta
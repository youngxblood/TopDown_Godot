extends CharacterBody2D
class_name BaseCharacter

@onready var animated_sprite : AnimatedSprite2D = $AnimatedSprite2D
@onready var anim_player : AnimationPlayer = $AnimationPlayer
@onready var health_component : HealthComponent = $Health_Component
@onready var projectilethrower_component : ProjectileThrowerComponent = $ProjectileThrower_Component
extends Node2D

@onready var detection_start_range : CollisionShape2D = $DetectionStart_Range
@onready var detection_end_range : CollisionShape2D = $DetectionEnd_Range

func _on_detection_start_body_entered(body):
	if body.name == "PlayerCharacter":
		print_debug("Yes")


func _on_detection_end_body_exited(body):
	pass # Replace with function body.

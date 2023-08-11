extends Node2D
class_name DetectionAreaComponent

signal player_detected()

@onready var detection_start_range : CollisionShape2D = $DetectionStart_Range
@onready var detection_end_range : CollisionShape2D = $DetectionEnd_Range

var player : PlayerCharacter
var owner_entity : BaseCharacter
var player_is_detected : bool = false


func _ready():
	owner_entity = self.get_owner()


## Player enters initial detection range
func _on_detection_start_body_entered(body):
	if body.name == "PlayerCharacter":
		emit_signal("player_detected") # Not currently used
		player_is_detected = true
		player = body


## Player leaves larger chase radius
func _on_detection_end_body_exited(body):
	if body.name == "PlayerCharacter":
		player_is_detected = false
		player = null
		

## If player is valid, returns their location. Otherwise, returns (0, 0)
func return_player_location():
	if player:
		return player.global_position
	else:
		return Vector2.ZERO


## Returns boolean of whether the player is detected or not
func check_if_player_detected():
	return player_is_detected;

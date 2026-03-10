extends Interactable
class_name ResourceNode

@export var resource_type: String = "Wood"
@export var amount: int = 1

var original_position: Vector3
var is_wiggling: bool = false
var wiggle_timer: float = 0.0
var wiggle_duration: float = 0.2
var wiggle_intensity: float = 0.1

func _ready() -> void:
	original_position = global_position

func interact(interactor: Node) -> void:
	if not is_wiggling:
		is_wiggling = true
		wiggle_timer = wiggle_duration

		# Assume interactor is the player or NPC that has a method to collect
		if interactor.has_method("collect_resource"):
			interactor.collect_resource(resource_type, amount)

func _process(delta: float) -> void:
	if is_wiggling:
		wiggle_timer -= delta
		if wiggle_timer <= 0:
			is_wiggling = false
			global_position = original_position
		else:
			# Simple wiggle effect
			var offset = Vector3(
				randf_range(-wiggle_intensity, wiggle_intensity),
				0,
				randf_range(-wiggle_intensity, wiggle_intensity)
			)
			global_position = original_position + offset

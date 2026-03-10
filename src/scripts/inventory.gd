extends Node

signal resource_added(type: String, amount: int)

var resources: Dictionary = {}

func add_resource(type: String, amount: int) -> void:
	if not resources.has(type):
		resources[type] = 0
	resources[type] += amount
	resource_added.emit(type, amount)
	print("Inventory added: ", amount, " ", type, ". Total: ", resources[type])

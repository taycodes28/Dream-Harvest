class_name SaveDataComponent
extends Node

@onready var parent_node: Node2D = get_parent() as Node2D

@export var save_data_resource: Resource

func _ready() -> void:
	add_to_group("save_data_component")


func _save_data() -> Resource:
	print("Trying to save:", parent_node.name)

	if parent_node == null:
		print("No parent node!")
		return null

	if save_data_resource == null:
		print("NO RESOURCE ON:", parent_node.name)
		return null

	print("Resource is:", save_data_resource)
	print("Has save function:", save_data_resource.has_method("_save_data"))

	if not save_data_resource.has_method("_save_data"):
		print("BAD RESOURCE ON:", parent_node.name)
		return null
	
	print(parent_node.name, " using ", save_data_resource.resource_path)
	save_data_resource._save_data(parent_node)

	return save_data_resource

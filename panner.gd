class_name Panner extends Node2D


@export var the_image: TextureRect

var mouse_in_image := false

@onready var old_mouse_position: Vector2 = get_global_mouse_position()


func _process(_delta: float) -> void:
	var mouse_position: Vector2 = get_global_mouse_position()
	
	if Input.is_action_pressed("pan") and is_visible_in_tree() and mouse_in_image:
		the_image.position += (mouse_position - old_mouse_position)
	
	old_mouse_position = mouse_position


func _on_center_image_pressed() -> void:
	the_image.position = Vector2.ZERO


func _on_the_image_mouse_entered() -> void:
	mouse_in_image = true


func _on_the_image_mouse_exited() -> void:
	mouse_in_image = false

extends Camera2D
## Handles the panning of the image.


func _on_under_ui_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseMotion and Input.is_action_pressed(&"pan"):
		position -= (event as InputEventMouseMotion).relative / zoom.x


func _on_center_image_pressed() -> void:
	position = Vector2.ZERO

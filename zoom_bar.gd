extends HSlider
## Handles the zoom controls.


@onready var _the_image := %TheImage as Sprite2D
@onready var _camera := %Camera2D as Camera2D
@onready var _zoom_label := %ZoomLabel as Label
@onready var _zoom_label_template := _zoom_label.text


func _ready() -> void:
	_zoom_label.text = _zoom_label_template % value


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed(&"zoom_in"):
		get_viewport().set_input_as_handled()
		value *= 2.0
	if event.is_action_pressed(&"zoom_out"):
		get_viewport().set_input_as_handled()
		value *= 0.5


func _on_value_changed(_value: float) -> void:
	_camera.zoom = Vector2.ONE * (value * 0.01)
	_zoom_label.text = _zoom_label_template % value


func _on_reset_zoom_pressed() -> void:
	value = 100.0


# Scaling algorithm adapted from: https://stackoverflow.com/a/31889091
func _on_fit_to_screen_pressed() -> void:
	var window_size := Vector2(get_window().size)
	var texture_size := Vector2(_the_image.texture.get_size())
	var window_ratio := window_size.x / window_size.y
	var texture_ratio := texture_size.x / texture_size.y
	
	var factor := (
			window_size.y / texture_size.y if window_ratio > texture_ratio
			else window_size.x / texture_size.x
	)
	
	value = factor * 100.0
	_camera.position = Vector2.ZERO

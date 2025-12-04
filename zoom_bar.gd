extends HSlider
## Handles the zoom controls.


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

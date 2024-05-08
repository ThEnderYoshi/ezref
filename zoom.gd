class_name Zoom extends HSlider


@export var label: Label
@export var the_image: TextureRect

var is_dragging := false

@onready var label_template: String = label.text


func _process(_delta: float) -> void:
	_update_zoom()


func _unhandled_input(event: InputEvent) -> void:
	if not is_visible_in_tree(): return
	
	if event.is_action_pressed("zoom_in"):
		get_viewport().set_input_as_handled()
		value *= 2
	elif event.is_action_pressed("zoom_out"):
		get_viewport().set_input_as_handled()
		value *= 0.5


func _update_zoom() -> void:
	the_image.scale = Vector2.ONE * (value * 0.01)
	label.text = label_template % value


func _on_drag_started() -> void:
	is_dragging = true


func _on_drag_ended(_value_changed: bool) -> void:
	is_dragging = false
	_update_zoom()


func _on_zoom_100_percent_pressed() -> void:
	value = 100.0
	_update_zoom()

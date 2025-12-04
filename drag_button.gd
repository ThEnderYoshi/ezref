extends Button
## A [Button] that performs some function when clicked and dragged.


enum Function {
	## Drags the window along with the mouse.
	DRAG_WINDOW,
	## Resizes the window along with the mouse.
	RESIZE_WINDOW,
}


## What this button does.
@export var function := Function.DRAG_WINDOW

var _is_dragging := false
var _clicked_pos := Vector2.ZERO


func _ready() -> void:
	button_down.connect(_on_button_down)
	button_up.connect(_on_button_up)


func _process(_delta: float) -> void:
	if not _is_dragging:
		return
	
	if function == Function.DRAG_WINDOW:
		get_window().position = DisplayServer.mouse_get_position() - Vector2i(_clicked_pos)
	else:
		get_window().size = get_global_mouse_position()


func _on_button_down() -> void:
	_is_dragging = true
	_clicked_pos = get_global_mouse_position()


func _on_button_up() -> void:
	_is_dragging = false

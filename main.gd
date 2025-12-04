extends Node2D
## The program's main script.


var _should_show_ui := 0

@onready var _the_image := %TheImage as Sprite2D
@onready var _ui_root := %Ui as CanvasLayer
@onready var _open_image := %OpenImage as FileDialog
@onready var _filter_popup := (%Filter as OptionButton).get_popup()


func _ready() -> void:
	var window := get_window()
	window.mouse_entered.connect(_incr_should_show_ui)
	window.mouse_exited.connect(_decr_should_show_ui)
	
	_ui_root.hide()
	_filter_popup.visibility_changed.connect(_on_filter_popup_visibility_changed)


func _input(event: InputEvent) -> void:
	if (
			event is InputEventMouseButton
			and (event as InputEventMouseButton).button_index == MOUSE_BUTTON_LEFT
	):
		if event.is_pressed():
			_incr_should_show_ui()
		else:
			_decr_should_show_ui()


func _incr_should_show_ui() -> void:
	_should_show_ui += 1
	
	if _should_show_ui == 1:
		_ui_root.show()


func _decr_should_show_ui() -> void:
	_should_show_ui -= 1
	
	if _should_show_ui == 0:
		_ui_root.hide()


func _on_filter_item_selected(index: int) -> void:
	_the_image.texture_filter = (
			CanvasItem.TEXTURE_FILTER_LINEAR if index == 0
			else CanvasItem.TEXTURE_FILTER_NEAREST
	)


func _on_open_pressed() -> void:
	_incr_should_show_ui()
	_open_image.popup_centered()


func _on_paste_pressed() -> void:
	var image := DisplayServer.clipboard_get_image()
	
	if is_instance_valid(image):
		_the_image.texture = ImageTexture.create_from_image(image)


func _on_open_image_file_selected(path: String) -> void:
	_the_image.texture = ImageTexture.create_from_image(Image.load_from_file(path))
	
	# HACK: If this isn't done, _should_show_ui gets desynced
	if not Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		_decr_should_show_ui()


func _on_open_image_canceled() -> void:
	_decr_should_show_ui()


func _on_filter_popup_visibility_changed() -> void:
	if not _filter_popup.visible:
		_decr_should_show_ui()


func _on_minimize_pressed() -> void:
	get_window().mode = Window.MODE_MINIMIZED


func _on_close_pressed() -> void:
	get_tree().quit()

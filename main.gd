class_name Main extends Control


const TOOLBAR_CHECK_PADDING: float = 10.0

@export var the_image: TextureRect
@export var toolbar: Control
@export var controls: Control
@export var file_dialog: FileDialog


var mouse_in_toolbar_zone := false:
	set(value):
		if value == mouse_in_toolbar_zone: return
		
		mouse_in_toolbar_zone = value
		var hide_pos: float = -toolbar.size.y
		toolbar.position.y = hide_pos if mouse_in_toolbar_zone else 0.0
		
		var tween: Tween = toolbar.create_tween() \
				.set_trans(Tween.TRANS_CUBIC) \
				.set_ease(Tween.EASE_OUT)
		
		tween.tween_property(
			toolbar,
			^"position:y",
			0.0 if mouse_in_toolbar_zone else hide_pos,
			0.2,
		)


func _process(_delta: float) -> void:
	var mouse_pos: Vector2 = get_global_mouse_position()
	
	mouse_in_toolbar_zone = (
			get_global_rect().has_point(mouse_pos)
			and mouse_pos.y <= (toolbar.size.y + TOOLBAR_CHECK_PADDING)
	)


func _paste_image() -> void:
	var image: Image = DisplayServer.clipboard_get_image()
	if not is_instance_valid(image): return
	
	var tex := ImageTexture.new()
	tex.set_image(image)
	the_image.texture = tex


# Toggle whether pan/zoom controls are disabled.
func _on_lock_controls_toggled(toggled_on: bool) -> void:
	controls.visible = not toggled_on


# Set The Image to the provided image file.
func _on_file_dialog_file_selected(path: String) -> void:
	var image: Image = Image.load_from_file(path)
	var tex := ImageTexture.new()
	tex.set_image(image)
	the_image.texture = tex


func _on_open_pressed() -> void:
	file_dialog.popup_centered()


func _on_paste_pressed() -> void:
	_paste_image()


func _on_nearest_neighbor_toggled(toggled_on: bool) -> void:
	the_image.texture_filter = TEXTURE_FILTER_NEAREST if toggled_on else TEXTURE_FILTER_LINEAR


func _on_resized() -> void:
	the_image.pivot_offset = the_image.size * 0.5

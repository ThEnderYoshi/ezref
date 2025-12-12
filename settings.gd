extends ConfirmationDialog
## Handles the display settings.


const _BACKGROUND_DARK = preload("uid://4eaf1w3kwexw")
const _BACKGROUND_LIGHT = preload("uid://bboylarca6xy2")

## The background image.
@export var background: TextureRect

## The main image.
@export var the_image: Sprite2D

@onready var _filter := %Filter as OptionButton
@onready var _bacgkground := %Background as OptionButton


func _ready() -> void:
	add_button("Apply", false, "apply")


func apply_changes() -> void:
	the_image.texture_filter = (
			CanvasItem.TEXTURE_FILTER_LINEAR if _filter.selected == 0
			else CanvasItem.TEXTURE_FILTER_NEAREST
	)
	
	
	get_window().transparent = _bacgkground.selected != 2
	get_window().transparent_bg = _bacgkground.selected != 2
	background.visible = _bacgkground.selected != 2
	background.texture = _BACKGROUND_DARK if _bacgkground.selected == 1 else _BACKGROUND_LIGHT


func _on_about_to_popup() -> void:
	_filter.selected = int(the_image.texture_filter == CanvasItem.TEXTURE_FILTER_NEAREST)
	
	_bacgkground.selected = (
			2 if not background.visible
			else int(background.texture == _BACKGROUND_DARK)
	)


func _on_custom_action(_action: StringName) -> void:
	apply_changes()

extends AcceptDialog
## Manages the help window.


func _ready() -> void:
	title %= [
		ProjectSettings.get_setting("application/config/name"),
		ProjectSettings.get_setting("application/config/version"),
	]
	
	(get_child(0) as RichTextLabel).text %= \
			ProjectSettings.get_setting("application/config/description")

extends Reference

const AUTO_QUIT: String = "WAT/AutoQuit"
const Window: Script = preload("window.gd")
const IO: Script = preload("io.gd")

static func set_run_path(path: String) -> void:
	ProjectSettings.set("WAT/ActiveRunPath", path)

static func clear(primary: bool = false):
	if ProjectSettings.has_setting("WAT/TestDouble"):
		ProjectSettings.get_setting("WAT/TestDouble").clear()
		ProjectSettings.get_setting("WAT/TestDouble").free()

static func create():
	if not ProjectSettings.has_setting("WAT/TestDouble"):
		var registry = load("res://addons/WAT/double/registry.gd")
		ProjectSettings.set_setting("WAT/TestDouble", registry.new())
		
static func handle_window():
	if ProjectSettings.get_setting("WAT/Minimize_Window_When_Running_Tests"):
		OS.window_minimized = true

static func set_minimize_on_load() -> void:
	if not ProjectSettings.has_setting("WAT/Minimize_Window_When_Running_Tests"):
		ProjectSettings.set_setting("WAT/Minimize_Window_When_Running_Tests", false)
		var property = {}
		property.name = "WAT/Minimize_Window_When_Running_Tests"
		property.type = TYPE_BOOL
		ProjectSettings.add_property_info(property)
		ProjectSettings.save()

class_name GameScreen extends Control

@export var level : Level 

func _ready():
	var level_buttons_container = get_node("%LevelButtonsContainer")
	var level_buttons = level_buttons_container.get_children() as Array[LevelButton] # _Vx
	for level_button in level_buttons:
		level_button.pressed.connect(_on_level_button_pressed.bind(level_button)) # _Vx
		
func _on_level_button_pressed(level_button: LevelButton):
	level = level_button.level
